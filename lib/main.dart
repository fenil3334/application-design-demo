import 'package:application_design_demo/bloc/dio_cubit.dart';
import 'package:application_design_demo/connectivityBloc/InternetCubit.dart';
import 'package:application_design_demo/controlers/adapter.dart';
import 'package:application_design_demo/datamodel/person_model.dart';
import 'package:application_design_demo/screens/carsoual_slider_screen.dart';
import 'package:application_design_demo/screens/custom_radio_button.dart';
import 'package:application_design_demo/screens/file_pick_from_storage.dart';
import 'package:application_design_demo/screens/home_screen.dart';
import 'package:application_design_demo/screens/listview_searchview.dart';
import 'package:application_design_demo/screens/movie_screen.dart';
import 'package:application_design_demo/screens/otp_screen.dart';
import 'package:application_design_demo/screens/pagination_listview.dart';
import 'package:application_design_demo/screens/splashscreen.dart';
import 'package:application_design_demo/screens/tab/tab_layout_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


const String dataBoxName = "data";

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<PersonModel>(dataBoxName);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.lightBlue
  ));


  runApp(const HomePage());
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // FlutterStatusbarcolor.setStatusBarColor(Colors.white);


    return BlocProvider(
      create: (context) => InternetCubit(connectivity:Connectivity()),
      child: MaterialApp(
          title: "First Demo",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
        //  home:  ListviewSearchview(),
        //  home:  PaginationListView(),
          home:  HomeScreen(),
         // home:  FilePickFromStorage(),
         // home:  CarsulaSliderScreen(),
        ),
    );
  }
}

