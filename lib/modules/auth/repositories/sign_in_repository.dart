import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/services/error/error_handler.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/network_info.dart';
import '../../../core/utils/constants.dart';
import '../models/user_model.dart';

class SignInRepository {
  final NetworkInfo _networkInfo;

  SignInRepository(this._networkInfo);

  Future<Either<Failure, UserModel>> signInAnonymously() async {
    final bool hasConnection = await _networkInfo.hasConnection;
    if (hasConnection) {
      try {
        final credential = await FirebaseAuth.instance.signInAnonymously();
        await FirebaseFirestore.instance
            .collection(Constants.users)
            .doc(credential.user!.uid)
            .set({"id": credential.user!.uid});
        return Right(UserModel.fromJson({"id": credential.user!.uid}));
      } on Exception catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(ErrorType.noInternetConnection.getFailure());
    }
  }
}
