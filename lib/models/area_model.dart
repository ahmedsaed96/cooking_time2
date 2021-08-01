class AreaModel {
  String? strArea;
  AreaModel(this.strArea);
  factory AreaModel.fromJson(Map<String, dynamic> map) {
    return AreaModel(map['strArea'] as String);
  }
}
