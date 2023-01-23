part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class RecordWeightLoadingState extends HomeStates {}

class RecordWeightSuccessState extends HomeStates {
  final String message;

  RecordWeightSuccessState(this.message);
}

class RecordWeightFailureState extends HomeStates {
  final Failure failure;

  RecordWeightFailureState(this.failure);
}
