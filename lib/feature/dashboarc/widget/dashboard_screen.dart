import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Welcome to DashBoard',
            style: TextStyle(fontSize: 26),
          ),
        ));
  }
}
