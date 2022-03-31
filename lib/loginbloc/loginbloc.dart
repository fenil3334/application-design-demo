import 'dart:async';

import 'package:application_design_demo/loginbloc/loginevent.dart';
import 'package:application_design_demo/loginbloc/loginstate.dart';
import 'package:application_design_demo/repostiry/dio_api_call.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  var _repository=ApiCallDioRepository();



  LoginBloc() : super(LoginStateIntilize()){
   on<LoginTextChange>((event, emit) {
     if(event.emailvalue==""){
       emit(OnError("PLease Enter Email"));
     }else if(EmailValidator.validate(event.emailvalue)){
       emit(OnError("PLease Enter Valid Email"));
     }else if(event.passwordValue==""){
       emit(OnError("PLease Enter Password"));
     }else{
       emit(onValidate());
     }
   });






   on<LoginSubmit>((event, emit) async {
     if(event.emailvalue==""){
       emit(OnError("PLease Enter Email"));
     }else if(EmailValidator.validate(event.emailvalue)){
       emit(OnError("PLease Enter Valid Email"));
     }else if(event.passwordValue==""){
       emit(OnError("PLease Enter Password"));
     }else{
       emit(OnLoading());
       final genreMovisLists = await _repository.getApiList();
       emit(OnSuccess(genreMovisLists));
     }
   });
  }



}