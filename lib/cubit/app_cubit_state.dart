import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitState extends Equatable {

}


class InitialState extends CubitState {

  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WelcomeState extends CubitState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LodingState extends CubitState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadedState extends CubitState {
  LoadedState(this.places) ;
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];

}

class DetailState extends CubitState {
  DetailState(this.places) ;
  final DataModel places;
  @override
  // TODO: implement props
  List<Object> get props => [places];

}