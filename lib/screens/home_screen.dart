import 'package:application_design_demo/screens/custom_calndar.dart';
import 'package:application_design_demo/screens/custom_map_marker_screen.dart';
import 'package:application_design_demo/screens/dio_screen.dart';
import 'package:application_design_demo/screens/google_map_screen.dart';
import 'package:application_design_demo/screens/hive_database_screen.dart';
import 'package:application_design_demo/screens/image_picker_screen.dart';
import 'package:application_design_demo/screens/login_witn_bloc.dart';
import 'package:application_design_demo/screens/movie_screen.dart';
import 'package:application_design_demo/screens/listview_checkbox.dart';
import 'package:application_design_demo/screens/product_screen.dart';
import 'package:application_design_demo/screens/spiral_matrix.dart';
import 'package:application_design_demo/screens/sqlite_database_screen.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);*/

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }



  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeUtils().sizeUnit(context);
   /* value: const SystemUiOverlayStyle(
      statusBarColor: Colors.white, //i like transaparent :-)
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
    ),*/
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: const Text("Movie Screen",
                      style: TextStyle(
                      fontSize: 13
                    ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return MovieScreen();
                      }));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    child: const Text("Add to Cart",
                      style: TextStyle(
                        fontSize: 13
                    ),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return ProductScreen();}));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),

                const SizedBox(height: 16,),



                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      shadowColor:null,
                        elevation: 0,

                        onPrimary: null,
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(50)
                        ),
                    ),

                    child: const Text('Listview with Checkbox',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),),

                    onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const ListviewCheckbox();}));
                    },

                  ),
                ),

                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Sqlite Database',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const SqliteDatabase();}));
                    },

                  ),
                ),



                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Hive Database',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const HiveDtaBaseSCreen();}));
                    },

                  ),
                ),




                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Pick Image From Gallery or Camera',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const ImagePickFromGallery();}));
                    },

                  ),
                ),



                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Google Map',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const GoogleMapScreen();}));
                    },

                  ),
                ),


                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Dio Api Call',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return const DioScreen();}));
                    },

                  ),
                ),



                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Login With Bloc Pattern',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginWithBloc();}));
                    },

                  ),
                ),





                const SizedBox(height: 16,),


                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Custom Calndar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CustomCalndar();}));
                    },

                  ),
                ),

                const SizedBox(height: 16,),



                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Spiral Matrix',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return SpiralMatrixScreen();}));
                    },

                  ),
                ),



                const SizedBox(height: 16,),




                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    elevation: 0,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    disabledElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    color: Colors.blue,
                    child: const Text('Google Map Marker Info Window',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                      ),),

                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {return CustomMapMarkerScreen();}));
                    },

                  ),
                ),



                const SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
