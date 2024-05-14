import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String? hintText;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const TextForm({
    Key? key,
    this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
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
          labelStyle: TextStyle(
            color: _focusNode.hasFocus
                ? Colors.blue
                : Colors.black, // Change the label text color based on focus
          ),
        ),
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        focusNode: _focusNode,
      ),
    );
  }
}
