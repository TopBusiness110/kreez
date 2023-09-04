// To parse this JSON data, do
//
//     final loginErrorModel = loginErrorModelFromJson(jsonString);

import 'dart:convert';

LoginErrorModel loginErrorModelFromJson(String str) => LoginErrorModel.fromJson(json.decode(str));

String loginErrorModelToJson(LoginErrorModel data) => json.encode(data.toJson());

class LoginErrorModel {
  String? jsonrpc;
  dynamic id;
  Error? error;

  LoginErrorModel({
    this.jsonrpc,
    this.id,
    this.error,
  });

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) => LoginErrorModel(
    jsonrpc: json["jsonrpc"],
    id: json["id"],
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "jsonrpc": jsonrpc,
    "id": id,
    "error": error?.toJson(),
  };
}

class Error {
  int? code;
  String? message;
  Data? data;

  Error({
    this.code,
    this.message,
    this.data,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? debug;
  String? message;
  List<String>? arguments;
  Context? context;

  Data({
    this.name,
    this.debug,
    this.message,
    this.arguments,
    this.context,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    debug: json["debug"],
    message: json["message"],
    arguments: json["arguments"] == null ? [] : List<String>.from(json["arguments"]!.map((x) => x)),
    context: json["context"] == null ? null : Context.fromJson(json["context"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "debug": debug,
    "message": message,
    "arguments": arguments == null ? [] : List<dynamic>.from(arguments!.map((x) => x)),
    "context": context?.toJson(),
  };
}

class Context {
  Context();

  factory Context.fromJson(Map<String, dynamic> json) => Context(
  );

  Map<String, dynamic> toJson() => {
  };
}
