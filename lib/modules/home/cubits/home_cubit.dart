import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/modules/auth/repositories/sign_in_repository.dart';
import 'package:weight_tracker/modules/home/models/request/weight_body.dart';
import 'package:weight_tracker/modules/home/repositories/home_repository.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/utils/globals.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitialState());

  WeightBody weightBody = WeightBody();

  Future<void> recordWeight() async {
    emit(RecordWeightLoadingState());
    final result = await _homeRepository.recordWeight(weightBody);
    result.fold(
      (failure) => emit(RecordWeightFailureState(failure)),
      (message) => emit(RecordWeightSuccessState(message)),
    );
  }
}
