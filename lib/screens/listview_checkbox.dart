import 'dart:convert';

import 'package:application_design_demo/datamodel/hospital_model.dart';
import 'package:application_design_demo/res/color.dart';
import 'package:application_design_demo/widget/hospital_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ListviewCheckbox extends StatefulWidget {
  const ListviewCheckbox({Key? key}) : super(key: key);

  @override
  _ListviewCheckboxState createState() => _ListviewCheckboxState();
}

class _ListviewCheckboxState extends State<ListviewCheckbox> {
  List<Hospital> hospitalmodel = [
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
    Hospital("test", false),
  ];

  late List<HospitalModel> _hospitalModel;

  Future<List<HospitalModel>> getData() async {
    List<HospitalModel> posts = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const API = 'https://api.jsonserve.com/TnQM6A';

      final http.Response response = await http.get(Uri.parse(API));
      List<dynamic> body = json.decode(response.body);

      posts = body
          .map(
            (dynamic item) => HospitalModel.fromJson(item),
          )
          .toList();
    } catch (err) {
      print(err);
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColor.bgColor, //i like transaparent :-)
        systemNavigationBarColor: AppColor.bgColor, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ),
      child: Material(
        child: SafeArea(
          child: Container(
            color: AppColor.bgColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                        future: getData(),
                        builder: (BuildContext context, AsyncSnapshot<List<HospitalModel>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (snapshot.hasData) {
                              _hospitalModel = snapshot.data ?? [];
                              return StatefulBuilder(builder: (context, _setState) {
                                return ListView.builder(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    itemCount: _hospitalModel.length,
                                    shrinkWrap: false,
                                    itemBuilder: (BuildContext context, int index) {
                                      return hospitalItem(_setState,index);
                                    });
                              });
                            } else {
                              return const Text('Empty data');
                            }
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ),
                  Container(
                    height: 41,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Submit Samples",
                            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget hospitalItem(Function(void Function()) _setState, int index ) {
    return GestureDetector(
      onTap: () {
        _setState(() {
          _hospitalModel[index].isselect = !_hospitalModel[index].isselect;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        child: Row(
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: _hospitalModel[index].isselect ? Colors.blue : null,
                  border: Border.all(color: Colors.blue)),
              child: _hospitalModel[index].isselect
                  ? const Icon(
                      Icons.check,
                      size: 12.0,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Card(
                elevation: 0,
                color: _hospitalModel[index].isselect ? Colors.blue : Colors.white,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17, top: 13, bottom: 13),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _hospitalModel[index].name,
                                  style: TextStyle(
                                      color: _hospitalModel[index].isselect ? Colors.white : Colors.black,
                                      fontSize: 13.2,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: 1,
                                  height: 20,
                                  color: _hospitalModel[index].isselect ? Colors.white : Colors.black,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  _hospitalModel[index].age.toString(),
                                  style: TextStyle(
                                      color: _hospitalModel[index].isselect ? Colors.white : Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  _hospitalModel[index].gender,
                                  style: TextStyle(
                                      color: _hospitalModel[index].isselect ? Colors.white : Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.navigation_rounded,
                                  size: 14,
                                  color: _hospitalModel[index].isselect ? Colors.white : Colors.blue,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "City Light, Surat",
                                  style: TextStyle(
                                      color: _hospitalModel[index].isselect ? Colors.white : Colors.black54,
                                      fontSize: 10.1,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        _hospitalModel[index].time,
                        style: TextStyle(
                            color: _hospitalModel[index].isselect ? Colors.white : Colors.black,
                            fontSize: 13.2,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hospital {
  String name;
  bool isCheck;

  Hospital(this.name, this.isCheck);
}
