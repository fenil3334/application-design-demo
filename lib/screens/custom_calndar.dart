import 'package:application_design_demo/screens/monthly_calndar.dart';
import 'package:application_design_demo/screens/yearly_calndar.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomCalndar extends StatefulWidget {
  CustomCalndar({Key? key}) : super(key: key);

  @override
  State<CustomCalndar> createState() => _CustomCalndarState();
}


class _CustomCalndarState extends State<CustomCalndar> with SingleTickerProviderStateMixin{
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: SizeUtils.verticalSize*7,
                width: double.infinity,

                child: Align(
                  alignment: Alignment.center,
                  child: Text('Custom Calndar',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),),
                ),
              ),



              Container(
                height: SizeUtils.verticalSize*6,
                color: Colors.green,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.transparent,

                  tabs: [
                    Text(
                      'Monthly',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Yearly',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),



              Expanded(
                flex: 3,
                child: TabBarView(         // Tab Bar View
                  physics: BouncingScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[MonthlyCalandar(), YearlyCalndar()],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
