import 'package:flutter/material.dart';
import 'package:movie_application/Utilities/CustomTextField.dart';

class EmptyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text("Movies Application"),
        ),
        body: Center(
          child: Text("The List is Empty"),
        ));
  }
}
