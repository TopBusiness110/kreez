// To parse this JSON data, do
//
//     final productsByCategoryIdModel = productsByCategoryIdModelFromJson(jsonString);

import 'dart:convert';

ProductsByCategoryIdModel productsByCategoryIdModelFromJson(String str) => ProductsByCategoryIdModel.fromJson(json.decode(str));

String productsByCategoryIdModelToJson(ProductsByCategoryIdModel data) => json.encode(data.toJson());

class ProductsByCategoryIdModel {
  final int? count;
  final dynamic prev;
  final int? current;
  final dynamic next;
  final int? totalPages;
  final List<Result>? result;

  @override
  String toString() {
    return 'ProductsByCategoryIdModel{count: $count, prev: $prev, current: $current, next: $next, totalPages: $totalPages, result: $result}';
  }

  ProductsByCategoryIdModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory ProductsByCategoryIdModel.fromJson(Map<String, dynamic> json) => ProductsByCategoryIdModel(
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
  final double? listPrice;
  final int? currencyId;
  final bool? isPublished;
  final UomName? uomName;
  final int? uomId;
  final List<int>? publicCategIds;
  final dynamic websiteRibbonId;
  final dynamic descriptionSale;
  final dynamic image1920;


  @override
  String toString() {
    return 'Result{id: $id, name: $name, listPrice: $listPrice, currencyId: $currencyId, isPublished: $isPublished, uomName: $uomName, uomId: $uomId, publicCategIds: $publicCategIds, websiteRibbonId: $websiteRibbonId, descriptionSale: $descriptionSale}';
  }

  Result({
    this.id,
    this.name,
    this.listPrice,
    this.currencyId,
    this.isPublished,
    this.uomName,
    this.uomId,
    this.publicCategIds,
    this.websiteRibbonId,
    this.descriptionSale,
    this.image1920,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    listPrice: json["list_price"],
    currencyId: json["currency_id"],
    isPublished: json["is_published"],
    uomName: uomNameValues.map[json["uom_name"]],
    uomId: json["uom_id"],
    publicCategIds: json["public_categ_ids"] == null ? [] : List<int>.from(json["public_categ_ids"]!.map((x) => x)),
    websiteRibbonId: json["website_ribbon_id"],
    descriptionSale: json["description_sale"],
    image1920: json["image_1920"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "list_price": listPrice,
    "currency_id": currencyId,
    "is_published": isPublished,
    "uom_name": uomNameValues.reverse[uomName],
    "uom_id": uomId,
    "public_categ_ids": publicCategIds == null ? [] : List<dynamic>.from(publicCategIds!.map((x) => x)),
    "website_ribbon_id": websiteRibbonId,
    "description_sale": descriptionSale,
    "image_1920": image1920,
  };
}

enum UomName {
  UNITS
}

final uomNameValues = EnumValues({
  "Units": UomName.UNITS
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
