// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String? hintText;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const TextForm({
    super.key,
    this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  late FocusNode _focusNode;
  late MaterialColor _labelColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _labelColor = Colors.blue;
        } else {
          _labelColor = Colors.grey;
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(color: _labelColor),
        ),
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        focusNode: _focusNode,
      ),
    );
  }
}
