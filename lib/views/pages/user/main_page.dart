import 'package:elmhanes/views/widgets/accordion.dart';
import 'package:elmhanes/views/widgets/custom_drawer.dart';
import 'package:elmhanes/views/widgets/custom_app_bar.dart';
import 'package:elmhanes/views/widgets/row_car.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static String id = 'MainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> categories = [
    'الأدوات المطلوبة لصيانة المحمول',
    'أجهزة قياس مكونات بوردة المحمول',
    'الأجهزة المطلوبة في صيانة المحمول',
    'فك وتركيب اي موبايل',
    'المكونات المادية للمحمول',
    'المكونات الألكترونية لبوردة المحمول',
    'الدوائر الرئيسية في المحمول ',
    'الدوائر الفرعية في المحول',
    'كيفية ازالة وتركيب المكونات',
    'اعطال وحلول',
  ];
  List<RowCard> rowCards = [
    const RowCard(),
    const RowCard(),
    const RowCard(),
    const RowCard(),
    const RowCard(),
    const RowCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return Accordion(
              title: categories[i],
              desc: 'وصف مختصر للقسم',
              child: Column(
                children: rowCards,
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
