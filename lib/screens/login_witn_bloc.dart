import 'dart:async';

import 'package:application_design_demo/loginbloc/loginbloc.dart';
import 'package:application_design_demo/loginbloc/loginevent.dart';
import 'package:application_design_demo/loginbloc/loginstate.dart';
import 'package:application_design_demo/screens/movie_screen.dart';
import 'package:application_design_demo/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWithBloc extends StatelessWidget {
  LoginWithBloc({Key? key}) : super(key: key);

  TextEditingController emailC = new TextEditingController();
  TextEditingController passwordC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));*/

    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: true,
          body: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Container(

                 child : Column(
                   children: [
                     Expanded(child: _topLayout()),
                     Expanded(child: _bottomLayout(context)),
                   ],
                 )

            ),
          ),
        ),
      ), //Wrap with Builder to access BlocProvider's context
    );
  }

  Widget _bottomLayout(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeUtils.verticalSize * 0.7,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.horizontalSize * 8.4, right: SizeUtils.horizontalSize * 8.4),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                  BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))
                ]),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalSize*3.7, vertical: 7),
                      child: TextField(
                        controller: emailC,
                        onChanged: (val) {
                          BlocProvider.of<LoginBloc>(context).add(LoginTextChange(emailC.text, passwordC.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email or Phone number",
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: SizeUtils.horizontalSize * 4.2)),
                      ),
                    ),
                    Container(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.verticalSize*3.7, vertical: 7),
                      child: TextField(
                        controller: passwordC,
                        onChanged: (val) {
                          BlocProvider.of<LoginBloc>(context).add(LoginTextChange(emailC.text, passwordC.text));
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: SizeUtils.horizontalSize * 4.2)),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is OnError) {
                    return Container(
                      height: 26,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.errorMsg,
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: SizeUtils.verticalSize * 4,
              ),



              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is OnSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MovieScreen()),
                    );
                   /* final timer = Timer(
                      const Duration(seconds: 3),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieScreen()),
                        );
                      },
                    );*/
                  }
                },
                builder: (context, state) {
                  if (state is OnLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginSubmit(emailC.text, passwordC.text));
                      },
                      child: Container(
                        height: SizeUtils.verticalSize*6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Flexible(
            fit: FlexFit.tight,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                )))
      ],
    );
  }

  Widget _topLayout() {
    {
      return Stack(fit: StackFit.expand, children: [
        Image.asset(
          "assets/image/background.png",
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeUtils.horizontalSize * 10, right: SizeUtils.horizontalSize * 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/light_1.png",
                    height: SizeUtils.verticalSize * 22,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalSize * 9,
                  ),
                  Image.asset(
                    "assets/image/light_2.png",
                    height: SizeUtils.verticalSize * 16.6,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeUtils.verticalSize * 10),
                child: Image.asset(
                  "assets/image/clock.png",
                  width: SizeUtils.horizontalSize * 14.5,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: SizeUtils.verticalSize * 2.5),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white, fontSize: SizeUtils.horizontalSize * 9.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]);
    }
  }
}
