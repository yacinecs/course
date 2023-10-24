import 'package:flutter/material.dart';

class Afterlogin extends StatefulWidget {
  const Afterlogin({super.key});

  @override
  State<Afterlogin> createState() => _AfterloginState();
}

class _AfterloginState extends State<Afterlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main UI"),
      ),
      body: const Text('hello world'),


    );
  }
}