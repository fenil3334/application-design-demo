import 'package:flutter/material.dart';

class HospitalItem extends StatefulWidget {

  final Function(String value) isChange;
  const HospitalItem({required this.isChange, Key? key}) : super(key: key);

  @override
  _HospitalItemState createState() => _HospitalItemState();
}

class _HospitalItemState extends State<HospitalItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ()  {
      widget.isChange.call("Sele");
    },child: Container());
  }
}
