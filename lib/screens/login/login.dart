import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zutter/components/Textform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: const Stack(
                  alignment: Alignment(0, 0.6),
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/zutter.png'),
                      radius: 100.0,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              TextForm(
                hintText: 'Enter username',
                labelText: 'Username*',
                suffixIcon: const Icon(Icons.person),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              TextForm(
                hintText: 'Enter password',
                labelText: 'Password*',
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
                obscureText: !passwordVisible,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login success!')),
                      );
                      context.pushReplacement('/main');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Text("I forgot my password")
            ],
          ),
        ),
      ),
    ));
  }
}
