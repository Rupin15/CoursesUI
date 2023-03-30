import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

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
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
                    color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
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
        )),
      ],
    );
  }

  Widget getTabbarPages() {
    return Container(
        height: 200,
        width: 200,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            Container(
                child: Text(
              "progress",
            )),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Completed",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [getTabBar(), getTabbarPages()],
        ),
      ),
    );
  }
}
