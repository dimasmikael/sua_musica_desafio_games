class KeywordModel {
  final dynamic id;
  final String name;

  KeywordModel(this.id, this.name);

  KeywordModel.fromJson(Map<String, dynamic> json)
   : id = json["id"],
     name = json["name"];
}