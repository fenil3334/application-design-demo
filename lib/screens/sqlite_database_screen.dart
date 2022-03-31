import 'package:application_design_demo/database/database_helper.dart';
import 'package:application_design_demo/datamodel/car_datamodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SqliteDatabase extends StatefulWidget {
  const SqliteDatabase({Key? key}) : super(key: key);

  @override
  _SqliteDatabaseState createState() => _SqliteDatabaseState();
}

class _SqliteDatabaseState extends State<SqliteDatabase> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  String UserName = '';
  String miles = '';
  List<Car> cars = [];
  late Car carmodel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _queryAll();
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
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: cars.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == cars.length) {
                          return MaterialButton(
                            height: 38,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                            elevation: 0,
                            color: Colors.green,
                            child: const Text('Refresh',style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              setState(() {
                                cars.clear();
                                _queryAll();
                              });
                            },
                          );
                        }
                        return Container(
                          height: 68,
                          margin: EdgeInsets.only(top: 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue
                          ),
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
                                      cars[index].name,
                                      style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                    ),
                                    const SizedBox(height: 2,),

                                    Text(
                                      '${cars[index].miles} miles',
                                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,
                                      color: Colors.white70),
                                    ),

                                    Spacer(),
                                  ],
                                ),
                              ),


                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      deleteData(cars[index].id);
                                    }, child: Icon(Icons.delete,color: Colors.white,size: 20,)
                                  ),

                                  SizedBox(width: 15,),

                                  InkWell(
                                      onTap: (){
                                        openAlertBox(cars[index].id,cars[index].name,cars[index].miles.toString());
                                      },
                                      child: Icon(Icons.edit,color: Colors.white,size: 20,)
                                  ),
                                  SizedBox(width: 18,)
                                ],
                              )

                            ],
                          ),
                        );
                      },
                    ),

            ),



                Card(
                  elevation: 100,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 1,
                          style: const TextStyle(fontSize: 13),
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Car Name',
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
                          controller: milesController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Miles',
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
                            int miles = int.parse(milesController.text);
                            _insert(name, miles);
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



  void  _insert(name, miles) async{
    Map<String, dynamic> row = {
      DatabaseHelper.carName : name,
      DatabaseHelper.carMiles  : miles,
    };
    final id = await dbHelper.insert(row);
    print("Id is:   $id" );
    _queryAll();
  }

  _queryAll() async {
    cars.clear();
    final allRows = await dbHelper.queryAllRows();
    for (var row in allRows) {
      {
      carmodel=Car(row["_id"],row["carName"],row["carMiles"]);
      cars.add(carmodel);
    };
    }
    setState(() {

    });
  }

  void _update(int key,String name,String miles) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : key,
      DatabaseHelper.carName : name,
      DatabaseHelper.carMiles  : miles
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
    _queryAll();
  }


  void deleteData(int itemId) async{
    int result = await dbHelper.delete(itemId);
    _queryAll();
  }





  openAlertBox(int key,String name1,String email1) {
    String name,email;
    name=name1;
    email=email1;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))
            ),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: 18,right: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Update Record",
                            style: TextStyle(fontSize: 23.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.blue[900],
                          height: 5.0,
                        ),
                        TextField(
                          controller: TextEditingController()..text = name1,
                          onChanged: (text){
                            name=text;
                          },
                          cursorColor: Colors.blue[900],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Car Name",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),


                        TextField(
                          controller: TextEditingController()..text = email1,
                          onChanged: (text){
                            email=text;
                          },
                          cursorColor: Colors.blue[900],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Miles",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      _update(key, name, email);
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },

                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }




  /*void _insert(name, miles) async {
    Map<String, dynamic> row = {DatabaseHelper.columnName: name, DatabaseHelper.columnMiles: miles};
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    //_showMessageInScaffold('inserted row id: $id');
  }



  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Car.fromMap(row)));
    setState(() {});
  }*/
}
