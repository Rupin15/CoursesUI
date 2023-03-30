import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';
import 'bookmark_box.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({Key? key,required this.data,required this.onBookMark}) : super(key: key);
  final data;
  final GestureTapCallback onBookMark;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005,
          horizontal: MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: Colors.black),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(1, 1),
            )
          ]),
      padding: EdgeInsets.only(top: 3, left: 3, right: 3),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.7,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.454,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
              imageUrl: data["image"],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.4,
            right: MediaQuery.of(context).size.width * 0.03,
            child: BookMarkBox(onBookMark: onBookMark, data: data["is_favorited"]),
          ),
          Positioned(

            left: 1,
            top: MediaQuery.of(context).size.width * 0.48,
            child: Container
              (
              padding: EdgeInsets.symmetric(horizontal: 4),
              width: MediaQuery.of(context).size.width*0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getAttributes(Icons.sell_outlined,data["price"],labelColor),
                      getAttributes(Icons.play_circle_fill_outlined,data["session"],labelColor),
                      getAttributes(Icons.schedule_outlined,data["duration"],labelColor),
                      getAttributes(Icons.star,data["review"].toString(),yellow),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  getAttributes(icon,name,color){
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(width: 5),
        Text(
          name,
          style: TextStyle(fontSize: 13, color: color),
        ),
      ],
    );
  }
}

