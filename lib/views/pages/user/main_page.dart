import 'package:elmhanes/views/widgets/custom_drawer.dart';
import 'package:elmhanes/views/widgets/extra_small_content_card_square.dart';
import 'package:elmhanes/views/widgets/small_content_card.dart';
import 'package:elmhanes/views/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static String id = 'MainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> topList = [
    SmallContentCard(
      title: 'الأدوات',
      icon: Icons.handyman,
      startColor: Colors.blue,
      endColor: Colors.lightBlue,
    ),
    SmallContentCard(
      title: 'الأجهزة',
      icon: Icons.ad_units,
      startColor: Colors.green,
      endColor: Colors.lightGreen,
    ),
    SmallContentCard(
      title: 'المكونات ',
      icon: Icons.drag_indicator,
      startColor: const Color(0xff45d6b5),
      endColor: const Color(0xff63c6c1),
    ),
    SmallContentCard(
      title: 'مشكلات',
      icon: Icons.perm_device_information_sharp,
      startColor: Colors.orange,
      endColor: Colors.orangeAccent,
    ),
  ];

  final List<Widget> midList = [
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
    ExtraSmallContentCardSquare(
      title: 'test',
      icon: Icons.ac_unit,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      /** */
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.width * .65,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3,
                crossAxisCount: 2,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: topList.length,
              itemBuilder: (BuildContext ctx, index) {
                return topList[index];
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                crossAxisCount: 3,
              ),
              scrollDirection: Axis.vertical,
              itemCount: midList.length,
              itemBuilder: (BuildContext ctx, index) {
                return midList[index];
              },
            ),
          ),
        ],
      ),
      /**/
      drawer: const CustomDrawer(),
    );
  }
}