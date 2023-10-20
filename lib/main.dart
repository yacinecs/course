import 'package:course1/firebase_options.dart';
import 'package:course1/views/Verify.dart';
import 'package:course1/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:course1/views/register.dart';
import 'package:flutter/material.dart';void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'course1',
      home: const HomePage(),
      routes: {
        '/login/' : (context) => const LoginView(),
        '/register/': (context) => const RegisterView()
      },
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
      
      
       builder: (context,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if(user!=null){
              if(user.emailVerified){  //ida kan false wla true (ne7ina no user bach ywli bool)
                print('Email is verified');
              }
              else{
                return const VerifyEmailView();
              }
            }
            else{
              return const LoginView();
            }
            return const Text('done');
          default:
            return const CircularProgressIndicator();
        }
       }
       );
  }
}