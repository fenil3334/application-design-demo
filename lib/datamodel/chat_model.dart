import 'package:get/get.dart';

class ChatModel {
  String message;
  String date;
  String type;
  String image;
  RxBool? isLike;

  ChatModel(this.message, this.date,this.type,this.image, {this.isLike});
}
