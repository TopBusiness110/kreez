// To parse this JSON data, do
//
//     final checkUserModel = checkUserModelFromJson(jsonString);

import 'dart:convert';

CheckUserModel checkUserModelFromJson(String str) => CheckUserModel.fromJson(json.decode(str));

String checkUserModelToJson(CheckUserModel data) => json.encode(data.toJson());

class CheckUserModel {
  final int? count;
  final dynamic prev;
  final int? current;
  final dynamic next;
  final int? totalPages;
  final List<Result>? result;

  CheckUserModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  @override
  String toString() {
    return 'CheckUserModel{count: $count, prev: $prev, current: $current, next: $next, totalPages: $totalPages, result: $result}';
  }

  factory CheckUserModel.fromJson(Map<String, dynamic> json) => CheckUserModel(
    count: json["count"],
    prev: json["prev"],
    current: json["current"],
    next: json["next"],
    totalPages: json["total_pages"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "prev": prev,
    "current": current,
    "next": next,
    "total_pages": totalPages,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  final int? id;
  final String? name;
  final int? partnerId;

  Result({
    this.id,
    this.name,
    this.partnerId,
  });

  @override
  String toString() {
    return 'Result{id: $id, name: $name, partnerId: $partnerId}';
  }

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    partnerId: json["partner_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "partner_id": partnerId,
  };
}
