import 'package:flutter/material.dart';
import 'package:online_course/screens/progress.dart';
import 'package:online_course/screens/watch_course.dart';
import './screens/root_app.dart';
import './theme/color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const RootApp(),
      routes: {
        "/watch": (context)=> WatchCourse(),
        "/progress":(context)=>Progress(),

      },
    );
  }
}
