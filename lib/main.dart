import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'pages/Homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
 await Hive.initFlutter();

 var box= await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent.withOpacity(0.5)),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}
