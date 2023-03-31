import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../theme/color.dart';
import '../utils/data.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  Widget getTabBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Courses",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SvgPicture.asset(
                "assets/icons/filter.svg",
                color: Colors.black,
              ),
            ],
          ),
        ),
        Container(
          child: TabBar(
            controller: tabController,
            indicatorColor: primary,
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
          ),
        ),
      ],
    );
  }

  Widget getTabbarPages(Size size) {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          ListView.builder(
            itemCount: myProgressCourses.length,
            padding: EdgeInsets.all(0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProgressCard(
                index: index,
                size: size,
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            getTabBar(),
            getTabbarPages(size),
          ],
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final index;
  final size;

  const ProgressCard({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                myProgressCourses[index]['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courses[index]['name'],
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width - 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      myProgressCourses[index]['completed'],
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      myProgressCourses[index]['progress'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              LinearPercentIndicator(
                width: size.width - 160,
                padding: EdgeInsets.all(0),
                lineHeight: 6,
                percent: myProgressCourses[index]['complete_percent'],
                barRadius: Radius.circular(4),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
