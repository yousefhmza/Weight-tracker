import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:weight_tracker/core/resources/app_strings.dart';
import 'package:weight_tracker/core/utils/globals.dart';
import 'package:weight_tracker/modules/home/models/request/weight_body.dart';
import '../../../core/services/error/error_handler.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/network_info.dart';
import '../../../core/utils/constants.dart';

class HomeRepository {
  final NetworkInfo _networkInfo;

  HomeRepository(this._networkInfo);

  Future<Either<Failure, String>> recordWeight(WeightBody weightBody) async {
    final bool hasConnection = await _networkInfo.hasConnection;
    if (hasConnection) {
      try {
        await FirebaseFirestore.instance
            .collection(Constants.users)
            .doc(currentUser!.id)
            .collection(Constants.weights)
            .add(weightBody.toJson());
        return const Right(AppStrings.savedWeightSuccessfully);
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }
}
