import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/adaptive_navigation.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedFilter = 'all';

  final List<Map<String, String>> _mockData = List.generate(
    20,
    (index) => {
      'id': 'ITEM${index + 1}',
      'number': '${index + 1}',
      'status': index % 3 == 0 ? 'active' : 'inactive',
      'date': '2024-01-${(index % 30) + 1}',
    },
  );

  List<Map<String, String>> get _filteredData {
    return _mockData.where((item) {
      final matchesSearch = 'list.item.title'
          .tr(args: [item['number']!])
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      final matchesFilter = _selectedFilter == 'all' ||
          (_selectedFilter == 'active' && item['status'] == 'active') ||
          (_selectedFilter == 'inactive' && item['status'] == 'inactive');
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdaptiveNavigation(selectedIndex: 1),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'list.search'.tr(),
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() => _searchQuery = value);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: _selectedFilter,
                        items: [
                          DropdownMenuItem(
                            value: 'all',
                            child: Text('list.filter.all'.tr()),
                          ),
                          DropdownMenuItem(
                            value: 'active',
                            child: Text('list.filter.active'.tr()),
                          ),
                          DropdownMenuItem(
                            value: 'inactive',
                            child: Text('list.filter.inactive'.tr()),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedFilter = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredData.length,
                    itemBuilder: (context, index) {
                      final item = _filteredData[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text('项目 ${item['number']}'),
                          subtitle: Text('ID: ${item['id']}'),
                          trailing: Chip(
                            label: Text('list.filter.${item['status']}'.tr()),
                            backgroundColor: item['status'] == 'active'
                                ? Colors.green.withOpacity(0.1)
                                : Colors.grey.withOpacity(0.1),
                            labelStyle: TextStyle(
                              color: item['status'] == 'active'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          onTap: () {
                            context.go('/detail/${item['id']}');
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
