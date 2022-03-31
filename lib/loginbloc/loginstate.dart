import 'package:application_design_demo/datamodel/dio_model.dart';

abstract class LoginState{}


class LoginStateIntilize extends LoginState{}


class onValidate extends LoginState{}


class OnError extends LoginState{
  String errorMsg;

  OnError(this.errorMsg);
}


class OnLoading extends LoginState{}



class OnSuccess extends LoginState{
  List<DioModel> diomodel;

  OnSuccess(this.diomodel);
}