// class AuthModel {
//   String? jsonrpc;
//   dynamic id;
//   Error? error;
//   Result? result;
//
//   AuthModel({this.jsonrpc, this.id, this.error, this.result});
//
//   factory AuthModel.fromJson(Map<String, dynamic> json){
//     return AuthModel(
//         jsonrpc: json["jsonrpc"],
//         id: json["id"],
//         result: json["result"]==null? null : Result.fromJson(json["result"]),
//         error: json["error"] == null ? null : Error.fromJson(json["error"])
//     );
//   }
//
//   Map<String, dynamic> toJson() =>
//       { "jsonrpc": jsonrpc,
//         "id": id,
//         "result": result,
//         "error": error
//       };
//
// }
// //****************** result model *********************
// class Result {
//   final int? uid;
//   final bool? isSystem;
//   final bool? isAdmin;
//   final UserContext? userContext;
//   final String? db;
//   final String? serverVersion;
//   final List<dynamic>? serverVersionInfo;
//   final String? supportUrl;
//   final String? name;
//   final String? username;
//   final String? partnerDisplayName;
//   final int? companyId;
//   final int? partnerId;
//   final String? webBaseUrl;
//   final int? activeIdsLimit;
//   final dynamic profileSession;
//   final dynamic profileCollectors;
//   final dynamic profileParams;
//   final int? maxFileUploadSize;
//   final bool? homeActionId;
//   final CacheHashes? cacheHashes;
//   final Map<String, Currency>? currencies;
//   final BundleParams? bundleParams;
//   final UserCompanies? userCompanies;
//   final bool? showEffect;
//   final bool? displaySwitchCompanyMenu;
//   final List<int>? userId;
//   final int? maxTimeBetweenKeysInMs;
//   final List<dynamic>? webTours;
//   final bool? tourDisable;
//   final String? notificationType;
//   final bool? mapBoxToken;
//   final String? uaType;
//   final bool? odoobotInitialized;
//   final String? appSystemName;
//   final String? appDocumentationUrl;
//   final String? appDocumentationDevUrl;
//   final String? appSupportUrl;
//   final String? appAccountTitle;
//   final String? appAccountUrl;
//   final String? appShowLang;
//   final String? appShowDebug;
//   final String? appShowDocumentation;
//   final String? appShowDocumentationDev;
//   final String? appShowSupport;
//   final String? appShowAccount;
//   final String? appShowPoweredby;
//   final List<AppLangList>? appLangList;
//   final bool? isErpManager;
//   final String? appNavbarPosPc;
//   final String? appNavbarPosMobile;
//   final bool? ocnTokenKey;
//   final bool? fcmProjectId;
//   final int? inboxAction;
//   final bool? iapCompanyEnrich;
//   final String? dbuuid;
//   final bool? multiLang;
//
//   Result({
//     this.uid,
//     this.isSystem,
//     this.isAdmin,
//     this.userContext,
//     this.db,
//     this.serverVersion,
//     this.serverVersionInfo,
//     this.supportUrl,
//     this.name,
//     this.username,
//     this.partnerDisplayName,
//     this.companyId,
//     this.partnerId,
//     this.webBaseUrl,
//     this.activeIdsLimit,
//     this.profileSession,
//     this.profileCollectors,
//     this.profileParams,
//     this.maxFileUploadSize,
//     this.homeActionId,
//     this.cacheHashes,
//     this.currencies,
//     this.bundleParams,
//     this.userCompanies,
//     this.showEffect,
//     this.displaySwitchCompanyMenu,
//     this.userId,
//     this.maxTimeBetweenKeysInMs,
//     this.webTours,
//     this.tourDisable,
//     this.notificationType,
//     this.mapBoxToken,
//     this.uaType,
//     this.odoobotInitialized,
//     this.appSystemName,
//     this.appDocumentationUrl,
//     this.appDocumentationDevUrl,
//     this.appSupportUrl,
//     this.appAccountTitle,
//     this.appAccountUrl,
//     this.appShowLang,
//     this.appShowDebug,
//     this.appShowDocumentation,
//     this.appShowDocumentationDev,
//     this.appShowSupport,
//     this.appShowAccount,
//     this.appShowPoweredby,
//     this.appLangList,
//     this.isErpManager,
//     this.appNavbarPosPc,
//     this.appNavbarPosMobile,
//     this.ocnTokenKey,
//     this.fcmProjectId,
//     this.inboxAction,
//     this.iapCompanyEnrich,
//     this.dbuuid,
//     this.multiLang,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     uid: json["uid"],
//     isSystem: json["is_system"],
//     isAdmin: json["is_admin"],
//     userContext: json["user_context"] == null ? null : UserContext.fromJson(json["user_context"]),
//     db: json["db"],
//     serverVersion: json["server_version"],
//     serverVersionInfo: json["server_version_info"] == null ? [] : List<dynamic>.from(json["server_version_info"]!.map((x) => x)),
//     supportUrl: json["support_url"],
//     name: json["name"],
//     username: json["username"],
//     partnerDisplayName: json["partner_display_name"],
//     companyId: json["company_id"],
//     partnerId: json["partner_id"],
//     webBaseUrl: json["web.base.url"],
//     activeIdsLimit: json["active_ids_limit"],
//     profileSession: json["profile_session"],
//     profileCollectors: json["profile_collectors"],
//     profileParams: json["profile_params"],
//     maxFileUploadSize: json["max_file_upload_size"],
//     homeActionId: json["home_action_id"],
//     cacheHashes: json["cache_hashes"] == null ? null : CacheHashes.fromJson(json["cache_hashes"]),
//     currencies: Map.from(json["currencies"]!).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
//     bundleParams: json["bundle_params"] == null ? null : BundleParams.fromJson(json["bundle_params"]),
//     userCompanies: json["user_companies"] == null ? null : UserCompanies.fromJson(json["user_companies"]),
//     showEffect: json["show_effect"],
//     displaySwitchCompanyMenu: json["display_switch_company_menu"],
//     userId: json["user_id"] == null ? [] : List<int>.from(json["user_id"]!.map((x) => x)),
//     maxTimeBetweenKeysInMs: json["max_time_between_keys_in_ms"],
//     webTours: json["web_tours"] == null ? [] : List<dynamic>.from(json["web_tours"]!.map((x) => x)),
//     tourDisable: json["tour_disable"],
//     notificationType: json["notification_type"],
//     mapBoxToken: json["map_box_token"],
//     uaType: json["ua_type"],
//     odoobotInitialized: json["odoobot_initialized"],
//     appSystemName: json["app_system_name"],
//     appDocumentationUrl: json["app_documentation_url"],
//     appDocumentationDevUrl: json["app_documentation_dev_url"],
//     appSupportUrl: json["app_support_url"],
//     appAccountTitle: json["app_account_title"],
//     appAccountUrl: json["app_account_url"],
//     appShowLang: json["app_show_lang"],
//     appShowDebug: json["app_show_debug"],
//     appShowDocumentation: json["app_show_documentation"],
//     appShowDocumentationDev: json["app_show_documentation_dev"],
//     appShowSupport: json["app_show_support"],
//     appShowAccount: json["app_show_account"],
//     appShowPoweredby: json["app_show_poweredby"],
//     appLangList: json["app_lang_list"] == null ? [] : List<AppLangList>.from(json["app_lang_list"]!.map((x) => AppLangList.fromJson(x))),
//     isErpManager: json["is_erp_manager"],
//     appNavbarPosPc: json["app_navbar_pos_pc"],
//     appNavbarPosMobile: json["app_navbar_pos_mobile"],
//     ocnTokenKey: json["ocn_token_key"],
//     fcmProjectId: json["fcm_project_id"],
//     inboxAction: json["inbox_action"],
//     iapCompanyEnrich: json["iap_company_enrich"],
//     dbuuid: json["dbuuid"],
//     multiLang: json["multi_lang"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "uid": uid,
//     "is_system": isSystem,
//     "is_admin": isAdmin,
//     "user_context": userContext?.toJson(),
//     "db": db,
//     "server_version": serverVersion,
//     "server_version_info": serverVersionInfo == null ? [] : List<dynamic>.from(serverVersionInfo!.map((x) => x)),
//     "support_url": supportUrl,
//     "name": name,
//     "username": username,
//     "partner_display_name": partnerDisplayName,
//     "company_id": companyId,
//     "partner_id": partnerId,
//     "web.base.url": webBaseUrl,
//     "active_ids_limit": activeIdsLimit,
//     "profile_session": profileSession,
//     "profile_collectors": profileCollectors,
//     "profile_params": profileParams,
//     "max_file_upload_size": maxFileUploadSize,
//     "home_action_id": homeActionId,
//     "cache_hashes": cacheHashes?.toJson(),
//     "currencies": Map.from(currencies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//     "bundle_params": bundleParams?.toJson(),
//     "user_companies": userCompanies?.toJson(),
//     "show_effect": showEffect,
//     "display_switch_company_menu": displaySwitchCompanyMenu,
//     "user_id": userId == null ? [] : List<dynamic>.from(userId!.map((x) => x)),
//     "max_time_between_keys_in_ms": maxTimeBetweenKeysInMs,
//     "web_tours": webTours == null ? [] : List<dynamic>.from(webTours!.map((x) => x)),
//     "tour_disable": tourDisable,
//     "notification_type": notificationType,
//     "map_box_token": mapBoxToken,
//     "ua_type": uaType,
//     "odoobot_initialized": odoobotInitialized,
//     "app_system_name": appSystemName,
//     "app_documentation_url": appDocumentationUrl,
//     "app_documentation_dev_url": appDocumentationDevUrl,
//     "app_support_url": appSupportUrl,
//     "app_account_title": appAccountTitle,
//     "app_account_url": appAccountUrl,
//     "app_show_lang": appShowLang,
//     "app_show_debug": appShowDebug,
//     "app_show_documentation": appShowDocumentation,
//     "app_show_documentation_dev": appShowDocumentationDev,
//     "app_show_support": appShowSupport,
//     "app_show_account": appShowAccount,
//     "app_show_poweredby": appShowPoweredby,
//     "app_lang_list": appLangList == null ? [] : List<dynamic>.from(appLangList!.map((x) => x.toJson())),
//     "is_erp_manager": isErpManager,
//     "app_navbar_pos_pc": appNavbarPosPc,
//     "app_navbar_pos_mobile": appNavbarPosMobile,
//     "ocn_token_key": ocnTokenKey,
//     "fcm_project_id": fcmProjectId,
//     "inbox_action": inboxAction,
//     "iap_company_enrich": iapCompanyEnrich,
//     "dbuuid": dbuuid,
//     "multi_lang": multiLang,
//   };
// }
//
// class Currency {
//   final String? symbol;
//   final String? position;
//   final List<int>? digits;
//
//   Currency({
//     this.symbol,
//     this.position,
//     this.digits,
//   });
//
//   factory Currency.fromJson(Map<String, dynamic> json) => Currency(
//     symbol: json["symbol"],
//     position: json["position"],
//     digits: json["digits"] == null ? [] : List<int>.from(json["digits"]!.map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "symbol": symbol,
//     "position": position,
//     "digits": digits == null ? [] : List<dynamic>.from(digits!.map((x) => x)),
//   };
// }
//
// class UserCompanies {
//   final int? currentCompany;
//   final Map<String, AllowedCompany>? allowedCompanies;
//
//   UserCompanies({
//     this.currentCompany,
//     this.allowedCompanies,
//   });
//
//   factory UserCompanies.fromJson(Map<String, dynamic> json) => UserCompanies(
//     currentCompany: json["current_company"],
//     allowedCompanies: Map.from(json["allowed_companies"]!).map((k, v) => MapEntry<String, AllowedCompany>(k, AllowedCompany.fromJson(v))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_company": currentCompany,
//     "allowed_companies": Map.from(allowedCompanies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//   };
// }
//
// class AllowedCompany {
//   final int? id;
//   final String? name;
//   final int? sequence;
//
//   AllowedCompany({
//     this.id,
//     this.name,
//     this.sequence,
//   });
//
//   factory AllowedCompany.fromJson(Map<String, dynamic> json) => AllowedCompany(
//     id: json["id"],
//     name: json["name"],
//     sequence: json["sequence"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "sequence": sequence,
//   };
// }
//
// class UserContext {
//   final String? lang;
//   final String? tz;
//   final int? uid;
//
//   UserContext({
//     this.lang,
//     this.tz,
//     this.uid,
//   });
//
//   factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
//     lang: json["lang"],
//     tz: json["tz"],
//     uid: json["uid"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lang": lang,
//     "tz": tz,
//     "uid": uid,
//   };
// }
//
// class AppLangList {
//   final int? id;
//   final String? code;
//   final String? name;
//
//   AppLangList({
//     this.id,
//     this.code,
//     this.name,
//   });
//
//   factory AppLangList.fromJson(Map<String, dynamic> json) => AppLangList(
//     id: json["id"],
//     code: json["code"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "code": code,
//     "name": name,
//   };
// }
//
// class BundleParams {
//   final String? lang;
//
//   BundleParams({
//     this.lang,
//   });
//
//   factory BundleParams.fromJson(Map<String, dynamic> json) => BundleParams(
//     lang: json["lang"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lang": lang,
//   };
// }
//
// class CacheHashes {
//   final String? translations;
//   final String? loadMenus;
//
//   CacheHashes({
//     this.translations,
//     this.loadMenus,
//   });
//
//   factory CacheHashes.fromJson(Map<String, dynamic> json) => CacheHashes(
//     translations: json["translations"],
//     loadMenus: json["load_menus"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "translations": translations,
//     "load_menus": loadMenus,
//   };
// }
//
// //********************* error model *******************
// class Error {
//   int? code;
//   String? message;
//   Data? data;
//
//   Error({
//     this.code,
//     this.message,
//     this.data,
//   });
//
//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//     code: json["code"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   String? name;
//   String? debug;
//   String? message;
//   List<String>? arguments;
//   Context? context;
//
//   Data({
//     this.name,
//     this.debug,
//     this.message,
//     this.arguments,
//     this.context,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     name: json["name"],
//     debug: json["debug"],
//     message: json["message"],
//     arguments: json["arguments"] == null ? [] : List<String>.from(json["arguments"]!.map((x) => x)),
//     context: json["context"] == null ? null : Context.fromJson(json["context"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "debug": debug,
//     "message": message,
//     "arguments": arguments == null ? [] : List<dynamic>.from(arguments!.map((x) => x)),
//     "context": context?.toJson(),
//   };
// }
//
// class Context {
//   Context();
//
//   factory Context.fromJson(Map<String, dynamic> json) => Context(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }


// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final String? jsonrpc;
  final dynamic id;
  final Error? error;
  final dynamic result;

  AuthModel({
    this.jsonrpc,
    this.id,
    this.error,
    this.result,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    jsonrpc: json["jsonrpc"],
    id: json["id"],
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
    result: json["result"] == null ? null :
    json["result"].runtimeType==int?
    json["result"]:
    Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "jsonrpc": jsonrpc,
    "id": id,
    "error": error?.toJson(),
    "result":
        result.runtimeType!=int?
    result?.toJson():result,
  };
}

class Error {
  final int? code;
  final String? message;
  final Data? data;

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
  final String? name;
  final String? debug;
  final String? message;
  final List<String>? arguments;
  final Context? context;

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

class Result {
  final int? uid;
  final bool? isSystem;
  final bool? isAdmin;
  final UserContext? userContext;
  final String? db;
  final String? serverVersion;
  final List<dynamic>? serverVersionInfo;
  final String? supportUrl;
  final String? name;
  final String? username;
  final String? partnerDisplayName;
  final int? companyId;
  final int? partnerId;
  final String? webBaseUrl;
  final int? activeIdsLimit;
  final dynamic profileSession;
  final dynamic profileCollectors;
  final dynamic profileParams;
  final int? maxFileUploadSize;
  final bool? homeActionId;
  final CacheHashes? cacheHashes;
  final Map<String, Currency>? currencies;
  final BundleParams? bundleParams;
  final UserCompanies? userCompanies;
  final bool? showEffect;
  final bool? displaySwitchCompanyMenu;
  final List<int>? userId;
  final List<dynamic>? webTours;
  final bool? tourDisable;
  final bool? mapBoxToken;
  final String? uaType;
  final String? appSystemName;
  final String? appDocumentationUrl;
  final String? appDocumentationDevUrl;
  final String? appSupportUrl;
  final String? appAccountTitle;
  final String? appAccountUrl;
  final String? appShowLang;
  final String? appShowDebug;
  final String? appShowDocumentation;
  final String? appShowDocumentationDev;
  final String? appShowSupport;
  final String? appShowAccount;
  final String? appShowPoweredby;
  final List<AppLangList>? appLangList;
  final bool? isErpManager;
  final String? appNavbarPosPc;
  final String? appNavbarPosMobile;
  final bool? ocnTokenKey;
  final bool? fcmProjectId;
  final int? inboxAction;
  final bool? iapCompanyEnrich;
  final String? dbuuid;
  final bool? multiLang;

  Result({
    this.uid,
    this.isSystem,
    this.isAdmin,
    this.userContext,
    this.db,
    this.serverVersion,
    this.serverVersionInfo,
    this.supportUrl,
    this.name,
    this.username,
    this.partnerDisplayName,
    this.companyId,
    this.partnerId,
    this.webBaseUrl,
    this.activeIdsLimit,
    this.profileSession,
    this.profileCollectors,
    this.profileParams,
    this.maxFileUploadSize,
    this.homeActionId,
    this.cacheHashes,
    this.currencies,
    this.bundleParams,
    this.userCompanies,
    this.showEffect,
    this.displaySwitchCompanyMenu,
    this.userId,
    this.webTours,
    this.tourDisable,
    this.mapBoxToken,
    this.uaType,
    this.appSystemName,
    this.appDocumentationUrl,
    this.appDocumentationDevUrl,
    this.appSupportUrl,
    this.appAccountTitle,
    this.appAccountUrl,
    this.appShowLang,
    this.appShowDebug,
    this.appShowDocumentation,
    this.appShowDocumentationDev,
    this.appShowSupport,
    this.appShowAccount,
    this.appShowPoweredby,
    this.appLangList,
    this.isErpManager,
    this.appNavbarPosPc,
    this.appNavbarPosMobile,
    this.ocnTokenKey,
    this.fcmProjectId,
    this.inboxAction,
    this.iapCompanyEnrich,
    this.dbuuid,
    this.multiLang,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    uid: json["uid"],
    isSystem: json["is_system"],
    isAdmin: json["is_admin"],
    userContext: json["user_context"] == null ? null : UserContext.fromJson(json["user_context"]),
    db: json["db"],
    serverVersion: json["server_version"],
    serverVersionInfo: json["server_version_info"] == null ? [] : List<dynamic>.from(json["server_version_info"]!.map((x) => x)),
    supportUrl: json["support_url"],
    name: json["name"],
    username: json["username"],
    partnerDisplayName: json["partner_display_name"],
    companyId: json["company_id"],
    partnerId: json["partner_id"],
    webBaseUrl: json["web.base.url"],
    activeIdsLimit: json["active_ids_limit"],
    profileSession: json["profile_session"],
    profileCollectors: json["profile_collectors"],
    profileParams: json["profile_params"],
    maxFileUploadSize: json["max_file_upload_size"],
    homeActionId: json["home_action_id"],
    cacheHashes: json["cache_hashes"] == null ? null : CacheHashes.fromJson(json["cache_hashes"]),
    currencies: Map.from(json["currencies"]!).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
    bundleParams: json["bundle_params"] == null ? null : BundleParams.fromJson(json["bundle_params"]),
    userCompanies: json["user_companies"] == null ? null : UserCompanies.fromJson(json["user_companies"]),
    showEffect: json["show_effect"],
    displaySwitchCompanyMenu: json["display_switch_company_menu"],
    userId: json["user_id"] == null ? [] : List<int>.from(json["user_id"]!.map((x) => x)),
    webTours: json["web_tours"] == null ? [] : List<dynamic>.from(json["web_tours"]!.map((x) => x)),
    tourDisable: json["tour_disable"],
    mapBoxToken: json["map_box_token"],
    uaType: json["ua_type"],
    appSystemName: json["app_system_name"],
    appDocumentationUrl: json["app_documentation_url"],
    appDocumentationDevUrl: json["app_documentation_dev_url"],
    appSupportUrl: json["app_support_url"],
    appAccountTitle: json["app_account_title"],
    appAccountUrl: json["app_account_url"],
    appShowLang: json["app_show_lang"],
    appShowDebug: json["app_show_debug"],
    appShowDocumentation: json["app_show_documentation"],
    appShowDocumentationDev: json["app_show_documentation_dev"],
    appShowSupport: json["app_show_support"],
    appShowAccount: json["app_show_account"],
    appShowPoweredby: json["app_show_poweredby"],
    appLangList: json["app_lang_list"] == null ? [] : List<AppLangList>.from(json["app_lang_list"]!.map((x) => AppLangList.fromJson(x))),
    isErpManager: json["is_erp_manager"],
    appNavbarPosPc: json["app_navbar_pos_pc"],
    appNavbarPosMobile: json["app_navbar_pos_mobile"],
    ocnTokenKey: json["ocn_token_key"],
    fcmProjectId: json["fcm_project_id"],
    inboxAction: json["inbox_action"],
    iapCompanyEnrich: json["iap_company_enrich"],
    dbuuid: json["dbuuid"],
    multiLang: json["multi_lang"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "is_system": isSystem,
    "is_admin": isAdmin,
    "user_context": userContext?.toJson(),
    "db": db,
    "server_version": serverVersion,
    "server_version_info": serverVersionInfo == null ? [] : List<dynamic>.from(serverVersionInfo!.map((x) => x)),
    "support_url": supportUrl,
    "name": name,
    "username": username,
    "partner_display_name": partnerDisplayName,
    "company_id": companyId,
    "partner_id": partnerId,
    "web.base.url": webBaseUrl,
    "active_ids_limit": activeIdsLimit,
    "profile_session": profileSession,
    "profile_collectors": profileCollectors,
    "profile_params": profileParams,
    "max_file_upload_size": maxFileUploadSize,
    "home_action_id": homeActionId,
    "cache_hashes": cacheHashes?.toJson(),
    "currencies": Map.from(currencies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "bundle_params": bundleParams?.toJson(),
    "user_companies": userCompanies?.toJson(),
    "show_effect": showEffect,
    "display_switch_company_menu": displaySwitchCompanyMenu,
    "user_id": userId == null ? [] : List<dynamic>.from(userId!.map((x) => x)),
    "web_tours": webTours == null ? [] : List<dynamic>.from(webTours!.map((x) => x)),
    "tour_disable": tourDisable,
    "map_box_token": mapBoxToken,
    "ua_type": uaType,
    "app_system_name": appSystemName,
    "app_documentation_url": appDocumentationUrl,
    "app_documentation_dev_url": appDocumentationDevUrl,
    "app_support_url": appSupportUrl,
    "app_account_title": appAccountTitle,
    "app_account_url": appAccountUrl,
    "app_show_lang": appShowLang,
    "app_show_debug": appShowDebug,
    "app_show_documentation": appShowDocumentation,
    "app_show_documentation_dev": appShowDocumentationDev,
    "app_show_support": appShowSupport,
    "app_show_account": appShowAccount,
    "app_show_poweredby": appShowPoweredby,
    "app_lang_list": appLangList == null ? [] : List<dynamic>.from(appLangList!.map((x) => x.toJson())),
    "is_erp_manager": isErpManager,
    "app_navbar_pos_pc": appNavbarPosPc,
    "app_navbar_pos_mobile": appNavbarPosMobile,
    "ocn_token_key": ocnTokenKey,
    "fcm_project_id": fcmProjectId,
    "inbox_action": inboxAction,
    "iap_company_enrich": iapCompanyEnrich,
    "dbuuid": dbuuid,
    "multi_lang": multiLang,
  };
}

class AppLangList {
  final int? id;
  final String? code;
  final String? name;

  AppLangList({
    this.id,
    this.code,
    this.name,
  });

  factory AppLangList.fromJson(Map<String, dynamic> json) => AppLangList(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
  };
}

class BundleParams {
  final String? lang;

  BundleParams({
    this.lang,
  });

  factory BundleParams.fromJson(Map<String, dynamic> json) => BundleParams(
    lang: json["lang"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
  };
}

class CacheHashes {
  final String? translations;
  final String? loadMenus;

  CacheHashes({
    this.translations,
    this.loadMenus,
  });

  factory CacheHashes.fromJson(Map<String, dynamic> json) => CacheHashes(
    translations: json["translations"],
    loadMenus: json["load_menus"],
  );

  Map<String, dynamic> toJson() => {
    "translations": translations,
    "load_menus": loadMenus,
  };
}

class Currency {
  final String? symbol;
  final String? position;
  final List<int>? digits;

  Currency({
    this.symbol,
    this.position,
    this.digits,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    symbol: json["symbol"],
    position: json["position"],
    digits: json["digits"] == null ? [] : List<int>.from(json["digits"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "position": position,
    "digits": digits == null ? [] : List<dynamic>.from(digits!.map((x) => x)),
  };
}

class UserCompanies {
  final int? currentCompany;
  final Map<String, AllowedCompany>? allowedCompanies;

  UserCompanies({
    this.currentCompany,
    this.allowedCompanies,
  });

  factory UserCompanies.fromJson(Map<String, dynamic> json) => UserCompanies(
    currentCompany: json["current_company"],
    allowedCompanies: Map.from(json["allowed_companies"]!).map((k, v) => MapEntry<String, AllowedCompany>(k, AllowedCompany.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "current_company": currentCompany,
    "allowed_companies": Map.from(allowedCompanies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class AllowedCompany {
  final int? id;
  final String? name;
  final int? sequence;

  AllowedCompany({
    this.id,
    this.name,
    this.sequence,
  });

  factory AllowedCompany.fromJson(Map<String, dynamic> json) => AllowedCompany(
    id: json["id"],
    name: json["name"],
    sequence: json["sequence"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sequence": sequence,
  };
}

class UserContext {
  final String? lang;
  final String? tz;
  final int? uid;

  UserContext({
    this.lang,
    this.tz,
    this.uid,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
    lang: json["lang"],
    tz: json["tz"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "tz": tz,
    "uid": uid,
  };
}
