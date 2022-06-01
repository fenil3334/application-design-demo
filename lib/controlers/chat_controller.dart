import 'package:application_design_demo/datamodel/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatControler extends GetxController {
  RxList<ChatModel> chatlist = RxList([]);
  ScrollController scrollController = ScrollController();
  RxBool isloadmore = true.obs;
  RxBool isLoadMoreRunning = false.obs;
  RxBool hasNextPage = true.obs;

  @override
  void onInit() {
    super.onInit();
    getChats();

    scrollController.addListener(pagination);
  }

  void pagination() {
    print('---------${scrollController.position.pixels}');
    print('============${scrollController.position.maxScrollExtent}');
    if ((scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        isLoadMoreRunning.value == false)) {
      isLoadMoreRunning.value = true;
      if (isloadmore.value) {
        isloadmore.value = false;
        new Future.delayed(const Duration(seconds: 7), () {
          chatlist.add(
            ChatModel("hiiii", '5 May 2022'),
          );
          chatlist.add(ChatModel("hiiii 32", '5 May 2022'));
          chatlist.add(ChatModel("hiiii 32", '5 May 2022'));
          chatlist.add(
            ChatModel("hiiii 33", '5 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 34", '5 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 35", '5 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 36", '5 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 37", '5 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 38", '6 May 2022'),
          );
          chatlist.add(
            ChatModel("hiiii 39", '6 May 2022'),
          );
          chatlist.add(ChatModel("hiiii 10", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 11", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 12", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 13", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 14", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 15", '6 May 2022'));
          chatlist.add(ChatModel("hiiii 16", '6 May 2022'));

          chatlist.refresh();
          print('----Refresh-----${chatlist.length}');

          isLoadMoreRunning.value = false;
        });
      } else {
        hasNextPage.value = false;
        isLoadMoreRunning.value = false;
      }
    }
  }

  getChats() {
    chatlist.add(
      ChatModel("hiiii", '2 May 2022', isLike: false.obs),
    );
    chatlist.add(ChatModel("hiiii 1", '2 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 2", '2 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 3", '2 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 4", '2 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 5", '2 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 6", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 7", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 8", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 9", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 10", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 11", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 12", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 13", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 14", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 15", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 16", '3 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 17", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 18", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 19", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 20", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 21", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 22", '4 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 23", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 24", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 25", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 26", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 27", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 28", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 29", '5 May 2022', isLike: false.obs));
    chatlist.add(ChatModel("hiiii 30", '5 May 2022', isLike: false.obs));
  }
}
