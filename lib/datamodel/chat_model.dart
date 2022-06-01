import 'package:get/get.dart';

class ChatModel {
  String message;
  String date;
  RxBool? isLike;

  ChatModel(this.message, this.date, {this.isLike});
}
