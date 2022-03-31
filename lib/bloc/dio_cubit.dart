import 'package:application_design_demo/bloc/dio_statement.dart';
import 'package:application_design_demo/repostiry/dio_api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DioCubit extends Cubit<DioStatement>{
  DioCubit() : super(DioStatementInitial());

  ApiCallDioRepository _repository=ApiCallDioRepository();

  Future<void> getApiCallingList() async {
    try {
      emit(OnLoading());
      final genreMovisLists = await _repository.getApiList();
      emit(OnSuccess(genreMovisLists));
    } catch (e) {
      throw e;
    }
  }

}