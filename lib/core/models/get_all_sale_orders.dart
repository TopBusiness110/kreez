// To parse this JSON data, do
//
//     final getAllSaleOrderModel = getAllSaleOrderModelFromJson(jsonString);

import 'dart:convert';

GetAllSaleOrderModel getAllSaleOrderModelFromJson(String str) => GetAllSaleOrderModel.fromJson(json.decode(str));

String getAllSaleOrderModelToJson(GetAllSaleOrderModel data) => json.encode(data.toJson());

class GetAllSaleOrderModel {
  final int? count;
  final dynamic prev;
  final int? current;
  final dynamic next;
  final int? totalPages;
  final List<Result>? result;

  GetAllSaleOrderModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory GetAllSaleOrderModel.fromJson(Map<String, dynamic> json) => GetAllSaleOrderModel(
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
  final String? displayName;
  final State? state;
  final String? writeDate;
  final double? amountTotal;

  Result({
    this.id,
    this.displayName,
    this.state,
    this.writeDate,
    this.amountTotal,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    displayName: json["display_name"],
    state: stateValues.map[json["state"]]!,
    writeDate: json["write_date"],
    amountTotal: json["amount_total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_name": displayName,
    "state": stateValues.reverse[state],
    "write_date": writeDate,
    "amount_total": amountTotal,
  };
}

enum State {
  DRAFT,
  SALE
}

final stateValues = EnumValues({
  "draft": State.DRAFT,
  "sale": State.SALE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
