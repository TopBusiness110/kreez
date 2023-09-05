// To parse this JSON data, do
//
//     final allCategoriesModel = allCategoriesModelFromJson(jsonString);

import 'dart:convert';

AllCategoriesModel allCategoriesModelFromJson(String str) => AllCategoriesModel.fromJson(json.decode(str));

String allCategoriesModelToJson(AllCategoriesModel data) => json.encode(data.toJson());

class AllCategoriesModel {
  int? count;
  dynamic prev;
  int? current;
  dynamic next;
  int? totalPages;
  List<Result>? result;

  AllCategoriesModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
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
  dynamic image1920;
  dynamic image1024;
  dynamic image512;
  dynamic image256;
  dynamic image128;
  bool? websiteId;
  bool? isSeoOptimized;
  bool? websiteMetaTitle;
  bool? websiteMetaDescription;
  bool? websiteMetaKeywords;
  bool? websiteMetaOgImg;
  bool? seoName;
  String? name;
  dynamic parentId;
  String? parentPath;
  List<int>? childId;
  List<int>? parentsAndSelf;
  int? sequence;
  bool? websiteDescription;
  List<int>? productTmplIds;
  int? id;
  Date? lastUpdate;
  String? displayName;
  int? createUid;
  Date? createDate;
  int? writeUid;
  Date? writeDate;

  Result({
    this.image1920,
    this.image1024,
    this.image512,
    this.image256,
    this.image128,
    this.websiteId,
    this.isSeoOptimized,
    this.websiteMetaTitle,
    this.websiteMetaDescription,
    this.websiteMetaKeywords,
    this.websiteMetaOgImg,
    this.seoName,
    this.name,
    this.parentId,
    this.parentPath,
    this.childId,
    this.parentsAndSelf,
    this.sequence,
    this.websiteDescription,
    this.productTmplIds,
    this.id,
    this.lastUpdate,
    this.displayName,
    this.createUid,
    this.createDate,
    this.writeUid,
    this.writeDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    image1920: json["image_1920"],
    image1024: json["image_1024"],
    image512: json["image_512"],
    image256: json["image_256"],
    image128: json["image_128"],
    websiteId: json["website_id"],
    isSeoOptimized: json["is_seo_optimized"],
    websiteMetaTitle: json["website_meta_title"],
    websiteMetaDescription: json["website_meta_description"],
    websiteMetaKeywords: json["website_meta_keywords"],
    websiteMetaOgImg: json["website_meta_og_img"],
    seoName: json["seo_name"],
    name: json["name"],
    parentId: json["parent_id"],
    parentPath: json["parent_path"],
    childId: json["child_id"] == null ? [] : List<int>.from(json["child_id"]!.map((x) => x)),
    parentsAndSelf: json["parents_and_self"] == null ? [] : List<int>.from(json["parents_and_self"]!.map((x) => x)),
    sequence: json["sequence"],
    websiteDescription: json["website_description"],
    productTmplIds: json["product_tmpl_ids"] == null ? [] : List<int>.from(json["product_tmpl_ids"]!.map((x) => x)),
    id: json["id"],
    lastUpdate: dateValues.map[json["__last_update"]]!,
    displayName: json["display_name"],
    createUid: json["create_uid"],
    createDate: dateValues.map[json["create_date"]]!,
    writeUid: json["write_uid"],
    writeDate: dateValues.map[json["write_date"]]!,
  );

  Map<String, dynamic> toJson() => {
    "image_1920": image1920,
    "image_1024": image1024,
    "image_512": image512,
    "image_256": image256,
    "image_128": image128,
    "website_id": websiteId,
    "is_seo_optimized": isSeoOptimized,
    "website_meta_title": websiteMetaTitle,
    "website_meta_description": websiteMetaDescription,
    "website_meta_keywords": websiteMetaKeywords,
    "website_meta_og_img": websiteMetaOgImg,
    "seo_name": seoName,
    "name": name,
    "parent_id": parentId,
    "parent_path": parentPath,
    "child_id": childId == null ? [] : List<dynamic>.from(childId!.map((x) => x)),
    "parents_and_self": parentsAndSelf == null ? [] : List<dynamic>.from(parentsAndSelf!.map((x) => x)),
    "sequence": sequence,
    "website_description": websiteDescription,
    "product_tmpl_ids": productTmplIds == null ? [] : List<dynamic>.from(productTmplIds!.map((x) => x)),
    "id": id,
    "__last_update": dateValues.reverse[lastUpdate],
    "display_name": displayName,
    "create_uid": createUid,
    "create_date": dateValues.reverse[createDate],
    "write_uid": writeUid,
    "write_date": dateValues.reverse[writeDate],
  };
}

enum Date {
  THE_202308290959,
  THE_202308291311
}

final dateValues = EnumValues({
  "2023-08-29-09-59": Date.THE_202308290959,
  "2023-08-29-13-11": Date.THE_202308291311
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
