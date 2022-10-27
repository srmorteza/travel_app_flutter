


import 'package:bloc/bloc.dart';
import 'package:travel/services/data_services.dart';

import '../model/data_model.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitState>{
  AppCubits({required this.data}): super(InitialState()){
    emit(WelcomeState()) ;
  }
  final DataServices data ;
  late final places;
  void getData() async {
    try{
      emit(LodingState());
      places= await data.getInfo();
      emit(LoadedState(places));

    }catch(e){

    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }
  goHome(){
    emit(LoadedState(places));
  }



}