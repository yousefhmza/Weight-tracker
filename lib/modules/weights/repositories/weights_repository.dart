import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:weight_tracker/core/utils/globals.dart';
import 'package:weight_tracker/modules/weights/models/response/weight_model.dart';
import '../../../core/services/network/network_info.dart';
import '../../../core/utils/constants.dart';

class WeightsRepository {
  final NetworkInfo _networkInfo;

  WeightsRepository(this._networkInfo);

  Stream<List<WeightModel>> listenToWeights() {
    return FirebaseFirestore.instance
        .collection(Constants.users)
        .doc(currentUser!.id)
        .collection(Constants.weights)
        .orderBy(Constants.date, descending: true)
        .snapshots()
        .map<List<WeightModel>>((snapshot) => snapshot.docs.map((item) => WeightModel.fromJson(item.data())).toList());
  }
}
