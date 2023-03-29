import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key,required this.name,
    required this.path,
    required this.onTap,
    this.activeColor=primary,
    this.bgColor=Colors.white,
    this.isActive=false}) : super(key: key);
  final String name;
  final String path;
  final Color activeColor;
  final Color bgColor;
  final bool isActive;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.only(top:MediaQuery.of(context).size.width*0.01,left: MediaQuery.of(context).size.width*0.01),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isActive? activeColor: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(.05),
                  blurRadius: .5,
                  spreadRadius: .5,
                  offset: Offset(1,1)
              )
            ]

        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Row(
          children: [
            SvgPicture.asset(path,
              color: isActive? Colors.white: darker,
              width: MediaQuery.of(context).size.width*0.04,
              height:MediaQuery.of(context).size.width*0.04,),
            SizedBox(width: MediaQuery.of(context).size.width*0.01),
            Text(name,style:
            TextStyle(color:isActive?Colors.white:darker)),
          ],
        ),
      ),
    );
  }
}
