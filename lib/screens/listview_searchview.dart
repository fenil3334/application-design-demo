import 'package:application_design_demo/controlers/chat_controller.dart';
import 'package:application_design_demo/controlers/listview_searchview_controler.dart';
import 'package:application_design_demo/datamodel/chat_model.dart';
import 'package:application_design_demo/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:get/get.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ListviewSearchview extends StatelessWidget {
  ListviewSearchview({Key? key}) : super(key: key);

  ListviewSearchviewControler controler = Get.put(ListviewSearchviewControler());

  ChatControler chatcontroler=Get.put(ChatControler());


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColor.white,
          child: Column(
            children: [
              /* Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                  onChanged: (text) {
                   controler.productNameSearch(text);
                  },

                ),
              ),*/


              /*   Expanded(child: Container(
                child: Obx((){
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: controler.list.length,
                      itemBuilder: (context,i){
                      return Container(
                        height: 42,
                        child: Center(
                          child: Text(controler.list[i].name,style: TextStyle(color: Colors.black,fontSize: 15),),
                        ),
                      );
                      }
                  );
                }),
              ))*/





             /* Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: chatlist.length,
                    itemBuilder: (ctx, index) {
                      return StickyHeader(header: Container(
                        width: double.infinity,

                        decoration: new BoxDecoration(
                          color: Colors.deepPurple,

                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(chatlist[index].date, style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),), content: Container(
                        child: Column(

                          children: [

                            ListView.builder(
                                itemCount:4,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context,i){
                                  return Container(height: 30,child: Center(
                                    child: Text('tes'),
                                  ),);
                            })
                          ],
                        ),
                      ));
                    }),
              )*/

         /*  Expanded(
             child: Obx((){
               return  StickyGroupedListView<ChatModel, String>(
                 elements: chatcontroler.chatlist,
                 order: StickyGroupedListOrder.ASC,
                 groupBy: (ChatModel element) =>
                 element.date,
                 groupComparator: (String value1, String value2) =>
                 0,
                 itemComparator: (ChatModel element1, ChatModel element2) =>
                 0,
                 floatingHeader: true,
                 groupSeparatorBuilder: (ChatModel element) => Container(
                   height: 50,
                   child: Align(
                     alignment: Alignment.center,
                     child: Container(
                       width: 120,
                       decoration: BoxDecoration(
                         color: Colors.blue[300],
                         border: Border.all(
                           color: Colors.blue[300]!,
                         ),
                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           '${element.date}',
                           textAlign: TextAlign.center,
                         ),
                       ),
                     ),
                   ),
                 ),
                 itemBuilder: (_, ChatModel element) {
                   return Card(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(6.0),
                     ),
                     elevation: 8.0,
                     margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                     child: Container(
                       child: ListTile(
                         contentPadding:
                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                         title: Text(element.message),
                       ),
                     ),
                   );
                 },
               );
             }),
           )*/


              Expanded(child: FlutterListView(
                  reverse: true,
                  delegate: FlutterListViewDelegate(
                          (BuildContext context, int index) {

                            if (index==5) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text('AAAAAAA'),
                              );
                            }else if(index==30){
                              return Align(
                                alignment: Alignment.center,
                                child: Text('VBBBB'),
                              );
                            } else {
                              return Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        ' chatListContents[index].msg',
                                        style: const TextStyle(
                                            fontSize: 14.0, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }

                          },
                      childCount: 45,
                      onItemKey: (index) => '25',
                      keepPosition: true,
                      keepPositionOffset: 80,
                      firstItemAlign: FirstItemAlign.end)))


            ],
          ),
        ),
      ),
    );
  }


}
