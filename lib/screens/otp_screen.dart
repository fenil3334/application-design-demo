import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPDigitTextFieldBox(first: true, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: false),
              OTPDigitTextFieldBox(first: false, last: true),
            ],
          )
        ]),
      ),
    );
  }
}




class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      { Key? key, required this.first, required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 5,right: 5),
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.yellow),
          ),
        ),
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 17
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            // contentPadding: EdgeInsets.all(0),
            counter: Offstage(),
         /*   enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.yellow),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.yellow),
                borderRadius: BorderRadius.circular(10)),*/
            hintText: "⬤",
            hintStyle: TextStyle(
                color: Colors.green,
                fontSize: 17
            ),
          ),
        ),
      ),
    );
  }
}
