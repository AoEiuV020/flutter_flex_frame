import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../widgets/adaptive_navigation.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, dynamic> _mockData = {
    'createTime': '2024-01-01',
    'updateTime': '2024-01-05',
    'owner': '张三',
    'team': <String>['张三', '李四', '王五'],
    'status': 'active',
    'documents': <Map<String, String>>[
      {'title': '项目计划书', 'type': 'PDF', 'size': '2.5MB'},
      {'title': '需求文档', 'type': 'Word', 'size': '1.8MB'},
      {'title': '设计稿', 'type': 'Figma', 'size': '4.2MB'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'detail.title'.tr(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              'ID: ${widget.id}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        label: Text('list.filter.${_mockData['status']}'.tr()),
                        backgroundColor: _mockData['status'] == 'active'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                        labelStyle: TextStyle(
                          color: _mockData['status'] == 'active'
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'detail.tabs.info'.tr()),
                    Tab(text: 'detail.tabs.stats'.tr()),
                    Tab(text: 'detail.tabs.docs'.tr()),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildInfoTab(),
                      _buildStatsTab(),
                      _buildDocumentsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'detail.info.description'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text('detail.description'.tr()),
          const SizedBox(height: 24),
          Text(
            'detail.info.basic_info'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          _buildInfoItem(
              'detail.info.create_time'.tr(), _mockData['createTime']!),
          _buildInfoItem(
              'detail.info.update_time'.tr(), _mockData['updateTime']!),
          _buildInfoItem('detail.info.owner'.tr(), _mockData['owner']!),
          const SizedBox(height: 24),
          Text(
            'detail.info.team'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: (_mockData['team'] as List<String>)
                .map((member) => Chip(label: Text(member)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    final stats = [
      {'key': 'dashboard.total_users', 'value': '1,234'},
      {'key': 'dashboard.active_users', 'value': '891'},
      {'key': 'dashboard.new_users', 'value': '+123'},
    ];

    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: stats.map<Widget>((stat) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stat['value']!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  stat['key']!.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDocumentsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: (_mockData['documents'] as List).length,
      itemBuilder: (context, index) {
        final doc = (_mockData['documents'] as List)[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const Icon(Icons.description),
            title: Text(doc['title']!),
            subtitle: Text('${doc['type']} • ${doc['size']}'),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                // TODO: Implement download
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
