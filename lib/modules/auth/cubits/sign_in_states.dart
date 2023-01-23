part of 'sign_in_cubit.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {}

class SignInFailureState extends SignInStates {
  final Failure failure;

  SignInFailureState(this.failure);
}
