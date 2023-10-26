import 'package:course1/main.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
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
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) {
              devtools.log(value.toString());
            }, itemBuilder: (context) {
              return const [
              PopupMenuItem<MenuAction>(
                value : MenuAction.logout, child: Text('logout')
              )
              ];
            },
          )
        ],
      ),
      body: const Text('hello world'),


    );
  }
}
Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(context: context,
   builder: (context) {
    return   AlertDialog(
      title: const Text('sign out'),
      content: const Text('are you sure you want to log out?'),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop(false);
        }, child: const Text('Cancel')),
        TextButton(onPressed: () {
          Navigator.of(context).pop(true);
        }, child: const Text('logout'))
      ],
    );
  },
  ).then((value) => value ?? false);

}