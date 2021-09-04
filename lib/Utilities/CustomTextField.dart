import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final hintText;
  final textfieldWidth;

  const CustomTextField(
      {Key? key, this.controller, this.hintText, this.textfieldWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 145,
      child: TextField(
        controller: this.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: this.hintText,
            border: OutlineInputBorder()),
      ),
    );
  }
}
