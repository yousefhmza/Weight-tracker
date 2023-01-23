class WeightModel {
  final String weight;
  final String date;

  WeightModel({required this.weight, required this.date});

  factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(
        weight: json["weight"] ?? "",
        date: json["date"] ?? "",
      );
}
