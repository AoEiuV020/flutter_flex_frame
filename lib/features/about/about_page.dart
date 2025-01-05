import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app.about'.tr()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 48,
            child: Icon(
              Icons.rss_feed,
              size: 48,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'app.title'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Version 1.0.0',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('GitHub'),
            subtitle: const Text('https://github.com/your/repo'),
            onTap: () {
              launchUrl(Uri.parse('https://github.com/your/repo'));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Report Issues'),
            subtitle: const Text('https://github.com/your/repo/issues'),
            onTap: () {
              launchUrl(Uri.parse('https://github.com/your/repo/issues'));
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('License'),
            subtitle: Text('MIT'),
          ),
        ],
      ),
    );
  }
}
