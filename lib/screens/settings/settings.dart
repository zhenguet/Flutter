import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          context.pushReplacement('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
        ),
        child: const Text('Logout'),
      ),
    );
  }
}
