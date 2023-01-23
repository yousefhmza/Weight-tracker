class WeightBody {
  String weight;
  String date;

  WeightBody({this.weight = "", this.date = ""});

  copyWith({String? weight, String? date}) {
    this.weight = weight ?? this.weight;
    this.date = date ?? this.date;
  }

  Map<String, dynamic> toJson() {
    return {"weight": weight, "date": date};
  }
}
