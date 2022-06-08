import 'package:application_design_demo/datamodel/assign_model.dart';
import 'package:application_design_demo/datamodel/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatControler extends GetxController {
  RxList<ChatModel> chatlist = RxList([]);
  List<AssignModel> assignTempList=[];
  List<String> selectIdList=[];
  RxList<AssignModel> assignModel=RxList([]);
  ScrollController scrollController = ScrollController();
  RxBool isloadmore = true.obs;
  RxBool isLoadMoreRunning = false.obs;
  RxBool hasNextPage = true.obs;

  @override
  void onInit() {
    super.onInit();
    getChats();

    scrollController.addListener(pagination);
    getAssignList();
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


  getAssignList(){
    assignTempList.add(AssignModel(1,"Abhay",false));
    assignTempList.add(AssignModel(2,"Vivek",false));
    assignTempList.add(AssignModel(3,"Monik",false));
    assignTempList.add(AssignModel(4,"Jeet",false));
    assignTempList.add(AssignModel(5,"Sagar",false));
    assignTempList.add(AssignModel(6,"Kalpesh",false));
    assignTempList.add(AssignModel(7,"Denish",false));
    assignTempList.add(AssignModel(8,"Abhay",false));
    assignTempList.add(AssignModel(9,"Jay",false));
    assignTempList.add(AssignModel(10,"Nayan",false));
    assignTempList.add(AssignModel(11,"fenil",false));
    assignTempList.add(AssignModel(12,"Vishal",false));
    assignTempList.add(AssignModel(13,"Anand",false));
    assignTempList.add(AssignModel(14,"Brijesh",false));
    assignTempList.add(AssignModel(15,"Tanmay",false));
    assignTempList.add(AssignModel(16,"Abhay",false));

    assignModel.value=assignTempList;
  }



  opendialog(BuildContext context){
    print('----temp lisr---${assignTempList.hashCode}');
    print('---- lisr---${assignModel.hashCode}');
    selectIdList.clear();
    assignModel.value=assignTempList;
    showModalBottomSheet(
      context: context,
      builder: (bCtx) {
        return  Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            color: Colors.white,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:18 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  SizedBox(
                    height: 8.0,
                  ),

                  Container(
                    height: 34,
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                        ),
                        onChanged: (text) {
                          searchassign(text);
                        },
                      )),

                  Expanded(child: Obx((){
                    return ListView.builder(
                        itemCount: assignModel.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        itemBuilder: (context,i){
                          return Obx((){
                            return GestureDetector(
                              onTap: (){


                                  final index = selectIdList.indexWhere((element) =>
                                  element.toString() == assignModel[i].id.toString());

                                print('Using indexWhere:--------- $index');

                                if(assignModel[i].isselect!){
                                  selectIdList.add(assignModel[i].id.toString());
                                }else{
                                  selectIdList.remove(index);
                                }
                                assignModel[i].isselect=!assignModel[i].isselect!;
                                assignModel.refresh();
                                /*  if (index >= 0) {
                                    // print('Using indexWhere: ${people[index]}');
                                    selectIdList.remove(index);
                                  }else{
                                    selectIdList.add(assignModel[i].id.toString());
                                  }
*/

                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(width: 1,color: Colors.black)
                                      ),
                                      child: Center(
                                        child: assignModel[i].isselect! ? Icon(Icons.check) : Container(),
                                      ),
                                    ),

                                    SizedBox(width: 15,),

                                    Text(assignModel[i].name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            );
                          });
                        }
                    );
                  })),

                  SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        Expanded(child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Center(child: Text('Cancel'),))),
                        Expanded(child: GestureDetector(
                            onTap: (){
                              for(int j=0; j<assignTempList.length; j++){
                                if(selectIdList.contains(assignTempList[j].id.toString())){
                                  assignTempList[j].isselect=true;
                                }else{
                                  assignTempList[j].isselect=false;
                                }
                              }
                              Navigator.pop(context);
                            },
                            child: Container(child: Center(child: Text('Submit'),)))),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );

  }



  searchassign(String name){
    if(name.isEmpty){
      assignModel.value=assignTempList;
    }else{
      assignModel.value = assignTempList
          .where((element) =>
          element.name.toString().toLowerCase().contains(name.toLowerCase()))
          .toList();
    }

  }
}
