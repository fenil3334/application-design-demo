import 'package:application_design_demo/datamodel/movie_model.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowDetail extends StatefulWidget {
  String movieName, imageurl;

  ShowDetail(this.movieName, this.imageurl, {Key? key}) : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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





  void displayPersistentBottomSheet() {
    _scaffoldKey.currentState!.showBottomSheet<void>((BuildContext context) {
      return SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.only(top: 10,bottom: 0),
          elevation: 13,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: SizeUtils.verticalSize * 4,
                ),


                const Text(
                  "Synopsis",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),

                SizedBox(
                  height: SizeUtils.verticalSize * 1,
                ),
                const Text(
                  "Ralph's goal was simple, wanting to win and get a medal to be consideres a hero. But without realizing Ralph instead paved the way for criminals who can kill all the games in the game complex.",
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Colors.black26),
                ),


                SizedBox(
                  height: SizeUtils.verticalSize * 3,
                ),


                const Text(
                  "Cast & Crew",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),

                SizedBox(
                  height: SizeUtils.verticalSize * 1,
                ),



                /* ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(left: 11),
                              itemCount: gamemodel.length,
                              shrinkWrap: true,
                              primary: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: GestureDetector(
                                    onTap: (){
                                    },
                                    child: Container(
                                      width: 90,

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              gamemodel[index].image,
                                              height: 90,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            gamemodel[index].name,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: SizeUtils.horizontalSize * 3,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black26),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),*/
              ],
            ),
          ),
        ),
      );
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
      ),
      child: Material(
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: SizeUtils.verticalSize * 7.5,
                      color: Colors.blue,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Movie Detail",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.verticalSize * 4,
                    ),
                    GestureDetector(
                      onTap: (){
                        displayPersistentBottomSheet();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          widget.imageurl,
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.verticalSize * 1.5,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.movieName,
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
