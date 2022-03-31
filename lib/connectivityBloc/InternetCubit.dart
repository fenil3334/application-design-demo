import 'dart:async';

import 'package:application_design_demo/connectivityBloc/InternetState.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState>{
  Connectivity connectivity=Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit( { required this.connectivity}) : super(InternetIntilize()){
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emit(InternetConnect());
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emit(InternetConnect());
          } else if (connectivityResult == ConnectivityResult.none) {
            emit(InternetDisconnect());
          }
        });
  }




  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}