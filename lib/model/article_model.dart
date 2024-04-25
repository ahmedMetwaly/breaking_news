class ResponseModel {
  String? status;
  int? totalResult;
  List<ArticleModel>? articles;
  ResponseModel();
  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResult = json["totalResults"];
    if (json["articles"] != null) {
      articles = <ArticleModel>[];
      json['articles'].forEach((v) {
        articles!.add(ArticleModel.fromJson(v));
      });
    }
  }
}

class ArticleModel {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? imageUrl;
  String? time;
  String? content;
  ArticleModel(
      {this.source,
      this.author,
      this.time,
      this.content,
      this.imageUrl,
      this.title,
      this.description,
      this.url});
  ArticleModel.fromJson(Map<String, dynamic> json) {
    source = SourceModel.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    imageUrl = json["urlToImage"];
    time = json["publishedAt"];
    content = json["content"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["source"] = source?.toJson();
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = imageUrl;
    data["time"] = time;
    data["content"] = content;

    return data;
  }
}

class SourceModel {
  String? id;
  String? name;
  SourceModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
