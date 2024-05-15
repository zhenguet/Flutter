// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<Map<String, String>> items = [
    {'id': 'en', 'value': 'Tiếng Anh'},
    {'id': 'vi', 'value': 'Tiếng Việt'},
  ];
  late String? item = items.first['value'];
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    const Text('Chọn ngôn ngữ: '),
                    DropdownButton2<String>(
                      value: item,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            item = newValue;
                          });
                        }
                      },
                      items: items.map((Map<String, String> item) {
                        return DropdownMenuItem<String>(
                          value: item['value'],
                          child: Text(item['value']!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Chọn chủ đề: "),
                    const Icon(Icons.wb_sunny),
                    Switch(
                      value: _isDarkModeEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isDarkModeEnabled = newValue;
                        });
                      },
                    ),
                    const Icon(Icons.nightlight_round),
                  ],
                ),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.pushReplacement('/login');
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
