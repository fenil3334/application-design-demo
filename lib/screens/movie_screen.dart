import 'package:application_design_demo/connectivityBloc/InternetCubit.dart';
import 'package:application_design_demo/connectivityBloc/InternetState.dart';
import 'package:application_design_demo/datamodel/movie_model.dart';
import 'package:application_design_demo/res/color.dart';
import 'package:application_design_demo/screens/show_detail.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:application_design_demo/utils/util.dart';
import 'package:application_design_demo/widget/smoothstarrating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({Key? key}) : super(key: key);

  List<MovieModel> moviemodel = [
    MovieModel("assets/image/m1.jpg", "Prithviraj", "4.1"),
    MovieModel("assets/image/m2.jpg", "Radhe Shyam", "3.5"),
    MovieModel("assets/image/m3.jpg", "Attack", "4.3"),
    MovieModel("assets/image/m4.jpg", "Major", "3.7"),
    MovieModel("assets/image/m5.jpg", "The Batman", "4.0"),
    MovieModel("assets/image/m6.jpg", "Prithviraj", "3.1"),
    MovieModel("assets/image/m7.jpg", "Radhe Shyam", "4.2"),
  ];

  List<MovieModel> gamemodel = [
    MovieModel("assets/image/1.jpg", "Candy Crush", "4.1"),
    MovieModel("assets/image/2.jpg", "Bowmasters", "3.5"),
    MovieModel("assets/image/3.jpg", "Need for Speed", "4.3"),
    MovieModel("assets/image/4.jpg", "Hunting Clash", "3.7"),
    MovieModel("assets/image/5.jpg", "West Game", "4.0"),
    MovieModel("assets/image/6.jpeg", "Street Chaser", "3.1"),
    MovieModel("assets/image/7.jpg", "Bike Blast-", "4.2"),
    MovieModel("assets/image/8.jpg", "Muscle Car Stunts", "3.2"),
    MovieModel("assets/image/9.jpg", "Stunt Driving Games", "2.9"),
    MovieModel("assets/image/10.png", "Major", "4.5"),
  ];

  List<MovieModel> comingsoonmodel = [
    MovieModel("assets/image/m1.jpg", "Prithviraj", "4.1"),
    MovieModel("assets/image/m2.jpg", "Radhe Shyam", "3.5"),
    MovieModel("assets/image/m3.jpg", "Attack", "4.3"),
    MovieModel("assets/image/m4.jpg", "Major", "3.7"),
    MovieModel("assets/image/m5.jpg", "The Batman", "4.0"),
    MovieModel("assets/image/m6.jpg", "Prithviraj", "3.1"),
    MovieModel("assets/image/m7.jpg", "Radhe Shyam", "4.2"),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Material(
        child: Container(
          color: AppColor.blue,
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: BlocConsumer<InternetCubit, InternetState>(
                  listener: (context, state) {
                    print('---------${state}');
                    if (state is InternetConnect) {
                     // Util.showCustomDialog(context);
                      Navigator.of(context).pop();
                    }else if(state is InternetDisconnect){
                      Util.showCustomDialog(context);
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          height: SizeUtils.verticalSize * 7,
                          color: AppColor.blue,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "First Demo",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
                                    child: SizedBox(
                                      height: SizeUtils.verticalSize * 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Tread Game",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3.8,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                          Text(
                                            "View All",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.verticalSize * 28,


                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.only(left: 11),
                                        itemCount: gamemodel.length,
                                        shrinkWrap: true,
                                        primary: true,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                                    ShowDetail(gamemodel[index].name, gamemodel[index].image)));
                                              },
                                              child: SizedBox(
                                                width: SizeUtils.verticalSize * 14,

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        gamemodel[index].image,
                                                        height: SizeUtils.verticalSize * 22,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: SizeUtils.verticalSize * 0.8,
                                                    ),
                                                    Text(
                                                      gamemodel[index].name,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize:
                                                          SizeUtils.horizontalSize * 3.5,
                                                          fontFamily: "Inter",
                                                          fontWeight: FontWeight.w500,
                                                          color: AppColor.black),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SmoothStarRating(
                                                            allowHalfRating: false,
                                                            starCount: 5,
                                                            rating: double.parse(gamemodel[index]
                                                                .rating
                                                                .toString()),
                                                            size: SizeUtils.horizontalSize * 4,
                                                            color: Colors.green,
                                                            borderColor: Colors.green,
                                                            spacing: 0.0)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.verticalSize * 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                    child: SizedBox(
                                      height: SizeUtils.verticalSize * 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Tread Movie",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3.8,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                          Text(
                                            "View All",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.verticalSize * 28,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.only(left: 11),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: moviemodel.length,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  moviemodel[index].image,
                                                  height: SizeUtils.verticalSize * 22,
                                                  width: SizeUtils.verticalSize * 14,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: SizeUtils.verticalSize * 0.8,
                                              ),
                                              Text(
                                                moviemodel[index].name,
                                                style: TextStyle(
                                                    fontSize:
                                                    SizeUtils.horizontalSize * 3.5,
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.black),
                                              ),
                                              Row(
                                                children: [
                                                  SmoothStarRating(
                                                      allowHalfRating: false,
                                                      starCount: 5,
                                                      rating: double.parse(moviemodel[index]
                                                          .rating
                                                          .toString()),
                                                      size: SizeUtils.horizontalSize * 4,
                                                      color: Colors.green,
                                                      borderColor: Colors.green,
                                                      spacing: 0.0)
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.verticalSize * 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                    child: SizedBox(
                                      height: SizeUtils.verticalSize * 4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Comming Soon",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3.8,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                          Text(
                                            "View All",
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                    child: GridView.builder(
                                      itemCount: comingsoonmodel.length,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1 / 1.8,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 8,
                                        // childAspectRatio: (2 / 1),
                                      ),
                                      itemBuilder: (context, index,) {
                                        return GestureDetector(
                                          onTap: () {

                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            color: Colors.black12,
                                            elevation: 0,


                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: SizeUtils.verticalSize * 30,

                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        child: Image.asset(comingsoonmodel[index].image,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )

                                                    ],
                                                  ),
                                                ),


                                                Expanded(
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: SizeUtils.verticalSize * 1,),

                                                        Text(comingsoonmodel[index].name,
                                                          style: TextStyle(
                                                            fontSize: SizeUtils.horizontalSize * 4,
                                                            fontFamily: "Inter",
                                                            fontWeight: FontWeight.w700,
                                                            color: AppColor.black,
                                                          ),
                                                        ),

                                                        SizedBox(height: SizeUtils.verticalSize * 0.5,),

                                                        Text(comingsoonmodel[index].rating,
                                                          style: TextStyle(
                                                            fontSize: SizeUtils.horizontalSize * 3.1,
                                                            fontFamily: "Inter",
                                                            fontWeight: FontWeight.w700,
                                                            color: AppColor.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                  }

              ),
            ),
          ),
        ),
      ),
    );
  }

}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
