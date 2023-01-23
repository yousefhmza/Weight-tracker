import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/modules/auth/repositories/sign_in_repository.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/utils/globals.dart';

part 'sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  final SignInRepository _signInRepository;

  SignInCubit(this._signInRepository) : super(SignInInitialState());

  Future<void> signInAnonymously() async {
    emit(SignInLoadingState());
    final result = await _signInRepository.signInAnonymously();
    result.fold(
      (failure) => emit(SignInFailureState(failure)),
      (user) {
        currentUser = user;
        emit(SignInSuccessState());
      },
    );
  }
}
