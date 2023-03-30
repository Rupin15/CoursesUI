import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class BookMarkBox extends StatelessWidget {
  const BookMarkBox({
    Key? key,
    required this.onBookMark,
    required this.data,
  }) : super(key: key);

  final GestureTapCallback onBookMark;
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBookMark,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: data["is_favorited"] ? primary : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                blurRadius: .1,
                spreadRadius: .1,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: SvgPicture.asset(
            "assets/icons/bookmark.svg",
            color:
                data["is_favorited"] ? Colors.white : primary.withOpacity(.5),
            height: MediaQuery.of(context).size.height * 0.035,
          ),
        ),
      ),
    );
  }
}
