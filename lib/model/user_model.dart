import 'package:breaking_news/model/article_model.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? phoneNumber;
  String? language;
  List<ArticleModel>? favouriteTopics;
  List<String>? interstedTopics;
  List<ArticleModel>? history;
 String? country;
  bool? emailVerfied;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.password,
    required this.emailVerfied,
    this.language,
    this.phoneNumber,
    this.favouriteTopics,
    this.interstedTopics,
    this.history,
    this.country,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json["password"];
    imageUrl = json["imageUrl"];
    emailVerfied = json["emailVerfied"];
    language = json["language"];
    phoneNumber = json["phoneNumber"];
    if (json['favouriteTopics'] != null) {
      favouriteTopics = <ArticleModel>[];
      json['favouriteTopics'].forEach((topic) {
        favouriteTopics!.add(ArticleModel.fromJson( topic));
      });
    }
    if (json['interstedTopics'] != null) {
      interstedTopics = <String>[];
      json['interstedTopics'].forEach((topic) {
        interstedTopics!.add(topic);
      });
    }
    if (json['history'] != null) {
      history = <ArticleModel>[];
      json['history'].forEach((topic) {
        history!.add(ArticleModel.fromJson( topic));
      });
    }
    country = json['country'];
   
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["imageUrl"] = imageUrl;
    data["emailVerfied"] = emailVerfied;
    data["country"] = country;
    data["language"] = language;
    data["phoneNumber"] = phoneNumber;
    if (favouriteTopics != null) {
      data['favouriteTopics'] = favouriteTopics!.map((v) => v).toList();
    }
    if (interstedTopics != null) {
      data['interstedTopics'] = interstedTopics!.map((v) => v).toList();
    }
    if (history != null) {
      data['history'] = history!.map((v) => v).toList();
    }
   
    return data;
  }
}
