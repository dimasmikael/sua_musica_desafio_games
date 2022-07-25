class CoverModel {
  final dynamic id;
  final dynamic height;
  final dynamic width;
  final dynamic imageId;
  final dynamic url;

  CoverModel(this.id, this.height, this.width, this.imageId, this.url);

  CoverModel.fromJson(Map<String, dynamic> json)
   : id = json["id"],
     height = json["height"],
     width = json["width"],
     imageId = json["image_id"],
     url = json["url"];
}