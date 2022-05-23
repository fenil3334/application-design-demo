import 'package:application_design_demo/screens/tab/tab_1.dart';
import 'package:flutter/material.dart';

class TabLayoutScreen extends StatefulWidget {
  const TabLayoutScreen({Key? key}) : super(key: key);

  @override
  _TabLayoutScreenState createState() => _TabLayoutScreenState();
}

class _TabLayoutScreenState extends State<TabLayoutScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  static const List<Tab> _tabs = [
    const Tab(icon: Icon(Icons.looks_one), child: const Text('Tab One')),
    const Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
  ];


  static const List<Widget> _views = [
    Tab1(),
    const Center(child: const Text('Content of Tab Two')),
  ];


  @override
  Widget build(BuildContext context) {
    return Material(
      child:  SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
              children: [
                Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      "Tabbar with out Appbar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Colors.blue,
                ),
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.red,
                  tabs: [
                    Tab(
                      text: '1st tab',
                    ),
                    Tab(
                      text: '2 nd tab',
                    )
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Tab1(),
                      Container(child: Center(child: Text('people'))),
                    ],
                    controller: _tabController,
                  ),
                ),

              ],
            ),
        ),
      ),


    );
  }
}