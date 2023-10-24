// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  final int? count;
  final dynamic prev;
  final int? current;
  final dynamic next;
  final int? totalPages;
  final List<Result>? result;

  UserData({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  @override
  String toString() {
    return 'UserData{count: $count, prev: $prev, current: $current, next: $next, totalPages: $totalPages, result: $result}';
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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

  Result({
    this.id,
    this.name,
  });

  @override
  String toString() {

    return 'Result{id: $id, name: $name}';

  }

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
