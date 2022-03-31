import 'package:application_design_demo/datamodel/person_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String dataBoxName = "data";

class HiveDtaBaseSCreen extends StatefulWidget {
  const HiveDtaBaseSCreen({Key? key}) : super(key: key);

  @override
  _SqliteDatabaseState createState() => _SqliteDatabaseState();
}

class _SqliteDatabaseState extends State<HiveDtaBaseSCreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  String UserName = '';
  String miles = '';
  late Box<PersonModel> dataBox;

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box<PersonModel>(dataBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: getAllData(),
                ),
                Card(
                  elevation: 100,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          style: const TextStyle(fontSize: 13),
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                          onChanged: (text) {
                            setState(() {
                              UserName = text;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: _countryController,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Country',
                          ),
                          style: const TextStyle(fontSize: 13),
                          onChanged: (text) {
                            setState(() {
                              miles = text;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 42,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                          elevation: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          disabledElevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          color: Colors.blue,
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            String name = nameController.text;
                            String country = _countryController.text;
                            _insert(name, country);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget getAllData() {
    return ValueListenableBuilder(
      valueListenable: dataBox.listenable(),
      builder: (BuildContext context, Box<PersonModel> value, Widget? child) {
        if (value.isEmpty) {
          return Center(
            child: Text('Empty'),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: value.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == value.length) {
                return MaterialButton(
                  height: 38,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  elevation: 0,
                  color: Colors.green,
                  child: const Text(
                    'Refresh',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      //cars.clear();
                      // _queryAll();
                    });
                  },
                );
              }
              return Container(
                height: 68,
                margin: EdgeInsets.only(top: 8),
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            value.getAt(index)!.name,
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            value.getAt(index)!.country,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white70),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _deleteInfo(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                            onTap: () {
                              // openAlertBox(cars[index].id, cars[index].name, cars[index].miles.toString());
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            )),
                        SizedBox(
                          width: 18,
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }

  _insert(name, miles) async {
    PersonModel newPerson = PersonModel(
      name: nameController.text,
      country: _countryController.text,
    );
    dataBox.add(newPerson);
    print('Info added to box!');

    getAllData();
  }

  _deleteInfo(int index) {
    dataBox.deleteAt(index);
    print('Item deleted from box at index: $index');


    getAllData();
  }
}
