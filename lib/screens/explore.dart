import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';

import '../widgets/category_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  getAppBar() {
    return Container(
      child: Row(
        children: [
          Text(
            "Explore",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 24),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: appBarColor,
          pinned: true,
          title: getAppBar(),
        ),
        SliverToBoxAdapter(
          child: getSearchBox(),
        ),
        SliverToBoxAdapter(child: getCategories()),
        SliverList(delegate: getCourses())
      ],
    ));
  }

  getCourses() {
    return SliverChildBuilderDelegate((context, index) {
      return Container(
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
        height: MediaQuery.of(context).size.width * 0.75,
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
                imageUrl: courses[0]["image"],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width*0.4,
              right: MediaQuery.of(context).size.width*0.03,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  color: primary.withOpacity(.5),
                  height: MediaQuery.of(context).size.height*0.035,
                ),
              ),
            ),
            Positioned(
              left: 15,
                top: MediaQuery.of(context).size.width*0.48,
                child:
            Column(

             children: [
                Text(courses[0]["name"],style: TextStyle(fontSize:20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),)
              ],
            ))
          ],
        ),
      );
    });
  }

  getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.05),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(0, 0),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.008),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;

  getCategories() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 15, top: 10, bottom: 5),
        child: Row(
            children: List.generate(
                categories.length,
                (index) => CategoryItem(
                      name: categories[index]["name"],
                      path: categories[index]["icon"],
                      isActive: index == selectedCategoryIndex,
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    ))));
  }

  changeActiveIndex(index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }
}
