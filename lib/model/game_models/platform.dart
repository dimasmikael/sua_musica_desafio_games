class PlatformModel {
  final int? id;
  String? name;
  String? games;
  // final String? alternativeName;
  // final String? abbreviation;

  PlatformModel(
    this.id,
    this.name,
    //   this.alternativeName,
    //  this.abbreviation
  );

  PlatformModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"].toString();
  //   alternativeName = json["alternative_name"],
  //  abbreviation = json["abbreviation"]  ;

  // PlatformModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //  // metric = json['metric'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //  // data['metric'] = metric;
  //   return data.toJS;
  // }
}
