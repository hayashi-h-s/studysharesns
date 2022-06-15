import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studysharesns/view/post/posts_index_page.dart';
import 'package:studysharesns/view/screen.dart';
import 'package:studysharesns/view/start_up/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
     home: const LoginPage()
    );
  }
}