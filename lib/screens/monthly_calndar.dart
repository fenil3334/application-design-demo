import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/material.dart';

class MonthlyCalandar extends StatelessWidget {
  MonthlyCalandar({Key? key}) : super(key: key);


  int weekday = DateTime.now().weekday - 1;
  String currentday="Monday";
  int totalday=0;
  List<String> daynamelist=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: SizeUtils.verticalSize * 7,
        ),
        Container(
          height: SizeUtils.verticalSize * 5,
          color: Colors.black12,
          child: Row(
            children: [
              dayname('S'),
              dayname('M'),
              dayname('T'),
              dayname('W'),
              dayname('T'),
              dayname('F'),
              dayname('S'),
            ],
          ),
        ),

        SizedBox(height: 8,),
        Expanded(child: _gridview(context)),
      ],
    ));
  }



  Widget _gridview(BuildContext context) {
    totalday=daynamelist.indexOf(currentday);

    return GridView.builder(
      itemCount: 31+totalday,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: (2 / 1),
      ),
      itemBuilder: (
        context,
        index,
      ) {
        if (index < totalday) {
          return Container();
        } else {
          int index1 = index - totalday;
          print(key);
          return InkWell(
            onTap: () {

              print("------------${(index1+1).toString()}");
              print('=====>${(index1+1).toString()}');
             /* Fluttertoast.showToast(
                  msg:(index1+1).toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );*/

            },
            child: Container(
              // color: RandomColorModel().getColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text((index1+1).toString(),
                      style: TextStyle(fontSize: 15, color: Colors.black), textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        }

      },
    );
  }

  Widget dayname(String name) {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    ));
  }
}
