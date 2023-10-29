
import 'package:flutter/material.dart';
import 'package:todo_list/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //init hive
await Hive.initFlutter();

//open the box
var box=await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
    );
  }
}


