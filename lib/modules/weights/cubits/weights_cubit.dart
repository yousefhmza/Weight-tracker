import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/modules/home/models/request/weight_body.dart';
import 'package:weight_tracker/modules/weights/models/response/weight_model.dart';
import 'package:weight_tracker/modules/weights/repositories/weights_repository.dart';

part 'weights_states.dart';

class WeightsCubit extends Cubit<WeightsStates> {
  final WeightsRepository _weightsRepository;

  WeightsCubit(this._weightsRepository) : super(WeightsInitialState());

  WeightBody weightBody = WeightBody();

  Stream<List<WeightModel>> weightsStream() => _weightsRepository.listenToWeights();
}
