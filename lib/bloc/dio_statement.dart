import 'package:application_design_demo/datamodel/dio_model.dart';

abstract class DioStatement{}

class DioStatementInitial extends DioStatement{

}

class OnSuccess extends DioStatement{
  List<DioModel> diomodel;

  OnSuccess(this.diomodel);
}

class OnFauilure extends DioStatement{

}


class OnLoading extends DioStatement{

}