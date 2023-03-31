import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
class WatchCourse extends StatefulWidget {
  const WatchCourse({Key? key}) : super(key: key);

  @override
  State<WatchCourse> createState() => _WatchCourseState();
}

class _WatchCourseState extends State<WatchCourse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height*0.4,
              child: Container(
                color: red,
              ),
            ),
            Text(
              "Description",style: TextStyle()
            )
          ],
        ),
      ),
    );
  }
}
