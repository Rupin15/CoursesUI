import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import 'custom_image.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({Key? key,required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: shadowColor.withOpacity(0.07),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1))
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImage(data["image"],
              radius: 10, width: 70, height: 70),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["name"],
                    style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: 14,
                      color: labelColor,
                    ),
                    SizedBox(width: 5),
                    Text(data["duration"],
                        style:
                        TextStyle(color: labelColor, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,color: labelColor,size:15,),
        ],
      ),
    );
  }
}
