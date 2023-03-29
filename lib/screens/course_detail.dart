import 'package:flutter/material.dart';
class CourseDetailApp extends StatefulWidget {
  const CourseDetailApp({Key? key}) : super(key: key);

  @override
  State<CourseDetailApp> createState() => _CourseDetailAppState();
}

class _CourseDetailAppState extends State<CourseDetailApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:buildBody(),
    );
  }

  buildAppBar() {
    return AppBar();
  }

  buildBody() {

  }
}
