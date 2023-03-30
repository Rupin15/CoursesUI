import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/utils/data.dart';
import 'package:online_course/widgets/category_box.dart';
import 'package:online_course/widgets/feature_item.dart';
import 'package:online_course/widgets/notification_box.dart';
import 'package:online_course/widgets/recommend_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double appBarHeight = 50;

    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
            expandedHeight: size.height * 0.06 > appBarHeight
                ? size.height * 0.06
                : appBarHeight,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(size),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile["name"]!,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Good Morning!",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          )),
          NotificationBox(
            notifiedNumber: 1,
            onTap: () {},
          )
        ],
      ),
    );
  }

  buildBody(Size size) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          getCategories(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text("Featured",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                )),
          ),
          getFeature(size),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          getRecommend(size),
        ]),
      ),
    );
  }

  int selectedCollection = 0;
  getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: () {
                setState(() {
                  selectedCollection = index;
                });
              },
              isSelected: selectedCollection == index,
            ),
          ),
        ),
      ),
    );
  }

  getFeature(Size size) {
    return CarouselSlider(
      options: CarouselOptions(
        //set height to minimum between size.height*0.35 and 290
        height: size.height * 0.35 > 290 ? size.height * 0.35 : 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: 0.75,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(onTap: () {}, data: features[index]),
      ),
    );
  }

  getRecommend(Size size) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
