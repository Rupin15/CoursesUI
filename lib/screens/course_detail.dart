import 'package:flutter/material.dart';
import 'package:online_course/widgets/custom_image.dart';
import 'package:online_course/widgets/lesson_item.dart';
import 'package:readmore/readmore.dart';
import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/bookmark_box.dart';

class CourseDetailApp extends StatefulWidget {
  const CourseDetailApp({Key? key,required this.data}) : super(key: key);
final data;
  @override
  State<CourseDetailApp> createState() => _CourseDetailAppState();
}

class _CourseDetailAppState extends State<CourseDetailApp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late var courseData;
  Widget getFooter() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ]),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(courseData["price"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: TextButton(
                  onPressed: () => {
                      Navigator.pushNamed(context, '/progress')
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primary,
                    ),
                    child: Text(
                      "Buy Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
            )
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseData=widget.data["course"];
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text(
       courseData["name"],
        style: TextStyle(color: textColor),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  Widget getTabBar() {
    return Container(
        child: TabBar(
          indicatorColor: primary,
      controller: tabController,
      tabs: [
        Tab(
          child: Text(
            "Lessons",
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ),
        Tab(
          child: Text(
            "Exercise",
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        )
      ],
    ));
  }

  Widget getTabbarPages() {
    return Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: double.infinity,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            getLessons(),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Coming Soon!",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ));
  }

  Widget getLessons() {
    return ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) => LessonItem(data: lessons[index]));
  }

  buildBody() {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Hero(
              tag:  courseData["id"].toString()+courseData["image"],
              child: CustomImage(
                courseData["image"],
                radius: 10,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getInfo(),
            SizedBox(height: 20),
            getTabBar(),
            getTabbarPages(),
          ],
        ),
      );

  }

  Widget getInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(  courseData["name"],style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
              BookMarkBox(
                data: courseData["is_favorited"],
                  onBookMark: () {

                  setState(() {
                    courseData["is_favorited"]=!courseData["is_favorited"];
                  });
                }),
            ],
          ),
          Row(
            children: [
              getAttribute(Icons.play_circle, courseData["session"], labelColor),
              SizedBox(width: 20),
              getAttribute(Icons.schedule_outlined, courseData["duration"], labelColor),
              SizedBox(width: 20),
              getAttribute(Icons.star, courseData["review"], yellow),
            ],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Course",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
              SizedBox(height: 10),
              Text(
                "Detail",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: labelColor),
              ),
              ReadMoreText(
                courseData["description"],
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show More",
                moreStyle: TextStyle(fontSize: 14, color: primary),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: labelColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget getAttribute(IconData icon, String text, Color color) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20,
        color: color,
      ),
      SizedBox(
        width: 5,
      ),
      Text(text, style: TextStyle(color: color)),
    ],
  );
}
