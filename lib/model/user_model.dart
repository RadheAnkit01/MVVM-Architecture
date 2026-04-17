// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String token;
  Meta meta;

  UserModel({required this.token, required this.meta});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(token: json["token"], meta: Meta.fromJson(json["_meta"]));

  Map<String, dynamic> toJson() => {"token": token, "_meta": meta.toJson()};
}

class Meta {
  String poweredBy;
  String docsUrl;
  String upgradeUrl;
  String exampleUrl;
  String variant;
  String message;
  Cta cta;
  String context;

  Meta({
    required this.poweredBy,
    required this.docsUrl,
    required this.upgradeUrl,
    required this.exampleUrl,
    required this.variant,
    required this.message,
    required this.cta,
    required this.context,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    poweredBy: json["powered_by"],
    docsUrl: json["docs_url"],
    upgradeUrl: json["upgrade_url"],
    exampleUrl: json["example_url"],
    variant: json["variant"],
    message: json["message"],
    cta: Cta.fromJson(json["cta"]),
    context: json["context"],
  );

  Map<String, dynamic> toJson() => {
    "powered_by": poweredBy,
    "docs_url": docsUrl,
    "upgrade_url": upgradeUrl,
    "example_url": exampleUrl,
    "variant": variant,
    "message": message,
    "cta": cta.toJson(),
    "context": context,
  };
}

class Cta {
  String label;
  String url;

  Cta({required this.label, required this.url});

  factory Cta.fromJson(Map<String, dynamic> json) =>
      Cta(label: json["label"], url: json["url"]);

  Map<String, dynamic> toJson() => {"label": label, "url": url};
}
