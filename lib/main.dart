import 'package:flutter/material.dart';
import 'package:studysharesns/view/post/posts_index_page.dart';
import 'package:studysharesns/view/screen.dart';

void main() {
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
     home: const Screen()
    );
  }
}