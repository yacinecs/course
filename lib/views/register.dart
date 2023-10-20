

import 'package:course1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
    late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email=TextEditingController();
    _password=TextEditingController();

    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: const Text('Register'),
      ),
      body: FutureBuilder(
            future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
 ),
        builder: (context,snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
            return Column(
        children: [
        TextField(
          decoration: const InputDecoration(hintText: 'User'),
          controller: _email,
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          decoration: const InputDecoration(hintText: 'Pass',),
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        TextButton(onPressed: () async{
          await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
 );
          final email=_email.text;
          final password = _password.text;
          try{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          
          }
          on FirebaseAuthException catch (e){
              if(e.code == 'weak-password'){
                print('weak password');
              }
              else if (e.code == 'email-already-in-use'){
                print('email already used');
              }
              else if (e.code == 'invalid-email'){
                print('invalide email adress');
              }
          }
          }, child: const Text('register'))
        
      ],
      );
      default:
      return const Text('loading');
      }
  }
      ),
    );
  }
  }