import 'package:application_design_demo/controlers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationListView extends StatefulWidget {
  const PaginationListView({Key? key}) : super(key: key);

  @override
  _PaginationListViewState createState() => _PaginationListViewState();
}

class _PaginationListViewState extends State<PaginationListView> {
  ChatControler controler = Get.put(ChatControler());

  String previousDate = '', currentdate = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Obx(() {
                return Column(
                  children: [
                    if (controler.isLoadMoreRunning.value)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),

                    // When nothing else to load
                    if (!controler.hasNextPage.value)
                      Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 40),
                        color: Colors.amber,
                        child: Center(
                          child: Text('You have fetched all of the content'),
                        ),
                      ),
                  ],
                );
              }),
              Expanded(child: Obx(() {
                return ListView.builder(
                    itemCount: controler.chatlist.length,
                    controller: controler.scrollController,
                    reverse: true,
                    itemBuilder: (context, i) {
                      // print(
                      //     '-----index---------$i ${controler.chatlist[i].date.toString()} ${previousDate.toString()} ${controler.chatlist[i].date.toString() != previousDate.toString()}');
                      bool isVisible;
                      // if (controler.chatlist[i].date.toString() == previousDate.toString()) {
                      //   currentdate = controler.chatlist[i].date;
                      //   isVisible = false;
                      // } else {
                      //   previousDate = controler.chatlist[i].date;
                      //   isVisible = true;
                      // }

                      currentdate = controler.chatlist[i].date;

                      if (i == 0) {
                        isVisible = false;
                      } else {
                        previousDate = controler.chatlist[i - 1].date;
                        isVisible = previousDate != currentdate;
                      }

                      return Column(
                        children: [
                          Container(
                            height: 40,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                 controler.chatlist[i].type.toString()==TYPE_TEXT  ?  Text(
                                    controler.chatlist[i].message + "    :   " + i.toString(),
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                  ) : Container(width: 30,
                                 height: 25,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(100),
                                   color: Colors.blue
                                 ),
                                 child: Center(
                                   child: Text(
                                     controler.chatlist[i].image,
                                     style: TextStyle(color: Colors.white, fontSize: 15),
                                   ),
                                 ),
                                 ),
                                  Obx(
                                      ()=> IconButton(
                                        onPressed: () {
                                          print(";;;;;; ${!(controler.chatlist[i].isLike?.value ?? false)}");
                                          controler.chatlist[i].isLike?.value = !(controler.chatlist[i].isLike?.value ?? false);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: (controler.chatlist[i].isLike?.value ?? false) ? Colors.red : Colors.grey[300],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: Container(
                              width: 150,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  previousDate,
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
