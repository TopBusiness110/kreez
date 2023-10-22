// // To parse this JSON data, do
// //
// //     final allProductsModel = allProductsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AllProductsModel allProductsModelFromJson(String str) => AllProductsModel.fromJson(json.decode(str));
//
// String allProductsModelToJson(AllProductsModel data) => json.encode(data.toJson());
//
// class AllProductsModel {
//   final int? count;
//   final dynamic prev;
//   final int? current;
//   final dynamic next;
//   final int? totalPages;
//   final List<Result>? result;
//
//   AllProductsModel({
//     this.count,
//     this.prev,
//     this.current,
//     this.next,
//     this.totalPages,
//     this.result,
//   });
//
//   factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
//     count: json["count"],
//     prev: json["prev"],
//     current: json["current"],
//     next: json["next"],
//     totalPages: json["total_pages"],
//     result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "prev": prev,
//     "current": current,
//     "next": next,
//     "total_pages": totalPages,
//     "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
//   };
// }
//
// class Result {
//   final int? id;
//   final String? name;
//   final double? listPrice;
//   final int? currencyId;
//   final bool? isPublished;
//   final String? uomName;
//   final int? uomId;
//   final List<int>? publicCategIds;
//   final dynamic websiteRibbonId;
//   final String? image1920;
//
//   Result({
//     this.id,
//     this.name,
//     this.listPrice,
//     this.currencyId,
//     this.isPublished,
//     this.uomName,
//     this.uomId,
//     this.publicCategIds,
//     this.websiteRibbonId,
//     this.image1920,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     name: json["name"],
//     listPrice: json["list_price"],
//     currencyId: json["currency_id"],
//     isPublished: json["is_published"],
//     uomName: json["uom_name"],
//     uomId: json["uom_id"],
//     publicCategIds: json["public_categ_ids"] == null ? [] : List<int>.from(json["public_categ_ids"]!.map((x) => x)),
//     websiteRibbonId: json["website_ribbon_id"],
//     image1920: json["image_1920"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "list_price": listPrice,
//     "currency_id": currencyId,
//     "is_published": isPublished,
//     "uom_name": uomName,
//     "uom_id": uomId,
//     "public_categ_ids": publicCategIds == null ? [] : List<dynamic>.from(publicCategIds!.map((x) => x)),
//     "website_ribbon_id": websiteRibbonId,
//     "image_1920": image1920,
//   };
// }

// To parse this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';

AllProductsModel allProductsModelFromJson(String str) => AllProductsModel.fromJson(json.decode(str));

String allProductsModelToJson(AllProductsModel data) => json.encode(data.toJson());

class AllProductsModel {
  int? count;
  dynamic prev;
  int? current;
  dynamic next;
  int? totalPages;
  List<Result>? result;

  AllProductsModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  @override
  String toString() {
    return 'AllProductsModel{count: $count, prev: $prev, current: $current, next: $next, totalPages: $totalPages, result: $result}';
  }

  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
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
  int? id;
  String? name;
  double? listPrice;
  int? currencyId;
  bool? isPublished;
  String? uomName;
  int? uomId;
  List<int>? publicCategIds;
  dynamic websiteRibbonId;
  dynamic descriptionSale;
  dynamic image1920;

  @override
  String toString() {
    return 'Result{id: $id, name: $name, listPrice: $listPrice, currencyId: $currencyId, isPublished: $isPublished, uomName: $uomName, uomId: $uomId, publicCategIds: $publicCategIds, websiteRibbonId: $websiteRibbonId, descriptionSale: $descriptionSale, }';
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
    uomName: json["uom_name"],
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
    "uom_name": uomName,
    "uom_id": uomId,
    "public_categ_ids": publicCategIds == null ? [] : List<dynamic>.from(publicCategIds!.map((x) => x)),
    "website_ribbon_id": websiteRibbonId,
    "description_sale": descriptionSale,
    "image_1920": image1920,
  };
}

