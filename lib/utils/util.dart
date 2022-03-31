import 'package:flutter/material.dart';

class Util{
  static void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 290,
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.only(left: 18,right: 18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/image/no_internet.jpg',height: 100,),

                const SizedBox(height: 15,),

                const Text('No Internet',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none),),

                const SizedBox(height: 12,),

                const Text('Please check your connection status and try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87,fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),),

                const SizedBox(height: 12,),


                MaterialButton(onPressed: (){},
                  minWidth: double.infinity,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  elevation: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  disabledElevation: 0,
                  hoverElevation: 0,
                  focusElevation: 0,
                  color: Colors.blue,
                child: Text('Close',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),),


              ],
            )

          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}