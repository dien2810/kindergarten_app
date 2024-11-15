// import 'dart:convert';
// import 'dart:typed_data';
// import '../schema/structs/index.dart';
//
// import 'package:flutter/foundation.dart';
//
// import '/flutter_flow/flutter_flow_util.dart';
// import 'api_manager.dart';
//
// export 'api_manager.dart' show ApiCallResponse;
//
// const _kPrivateApiFunctionName = 'ffPrivateApiCall';
//
// /// Start Product Group Code
//
// class ProductGroup {
//   static String getBaseUrl() =>
//       'https://xhlo-lkyx-rhhz.n7c.xano.io/api:QAJQKamF';
//   static Map<String, String> headers = {};
//   static GetProductListCall getProductListCall = GetProductListCall();
//   static GetCategoryProductListCall getCategoryProductListCall =
//       GetCategoryProductListCall();
//   static GetSingleProductCall getSingleProductCall = GetSingleProductCall();
//   static CreateOrderCall createOrderCall = CreateOrderCall();
//   static GetAllOrdersCall getAllOrdersCall = GetAllOrdersCall();
// }
//
// class GetProductListCall {
//   Future<ApiCallResponse> call() async {
//     final baseUrl = ProductGroup.getBaseUrl();
//
//     return ApiManager.instance.makeApiCall(
//       callName: 'Get Product List',
//       apiUrl: '${baseUrl}/products',
//       callType: ApiCallType.GET,
//       headers: {},
//       params: {},
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// class GetCategoryProductListCall {
//   Future<ApiCallResponse> call({
//     String? categoryName = '',
//   }) async {
//     final baseUrl = ProductGroup.getBaseUrl();
//
//     return ApiManager.instance.makeApiCall(
//       callName: 'Get Category Product List',
//       apiUrl: '${baseUrl}/categoryProducts',
//       callType: ApiCallType.GET,
//       headers: {},
//       params: {
//         'category_name': categoryName,
//       },
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// class GetSingleProductCall {
//   Future<ApiCallResponse> call({
//     int? productId,
//   }) async {
//     final baseUrl = ProductGroup.getBaseUrl();
//
//     return ApiManager.instance.makeApiCall(
//       callName: 'Get Single Product',
//       apiUrl: '${baseUrl}/products/${productId}',
//       callType: ApiCallType.GET,
//       headers: {},
//       params: {},
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// class CreateOrderCall {
//   Future<ApiCallResponse> call({
//     String? orderDate = '',
//     String? userId = '',
//     dynamic? productItemsJson,
//     double? totalAmount,
//   }) async {
//     final baseUrl = ProductGroup.getBaseUrl();
//
//     final productItems = _serializeJson(productItemsJson, true);
//     final ffApiRequestBody = '''
// {
//   "orderDate": "${orderDate}",
//   "userId": "${userId}",
//   "productItems": ${productItems},
//   "totalAmount": ${totalAmount}
// }''';
//     return ApiManager.instance.makeApiCall(
//       callName: 'Create Order',
//       apiUrl: '${baseUrl}/orders',
//       callType: ApiCallType.POST,
//       headers: {},
//       params: {},
//       body: ffApiRequestBody,
//       bodyType: BodyType.JSON,
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// class GetAllOrdersCall {
//   Future<ApiCallResponse> call({
//     String? userId = '',
//   }) async {
//     final baseUrl = ProductGroup.getBaseUrl();
//
//     return ApiManager.instance.makeApiCall(
//       callName: 'Get All Orders',
//       apiUrl: '${baseUrl}/orders',
//       callType: ApiCallType.GET,
//       headers: {},
//       params: {
//         'user_id': userId,
//       },
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// /// End Product Group Code
//
// class GetCategoryListCall {
//   static Future<ApiCallResponse> call() async {
//     return ApiManager.instance.makeApiCall(
//       callName: 'Get Category List',
//       apiUrl: 'https://xhlo-lkyx-rhhz.n7c.xano.io/api:QAJQKamF/category',
//       callType: ApiCallType.GET,
//       headers: {},
//       params: {},
//       returnBody: true,
//       encodeBodyUtf8: false,
//       decodeUtf8: false,
//       cache: false,
//       isStreamingApi: false,
//       alwaysAllowBody: false,
//     );
//   }
// }
//
// class ApiPagingParams {
//   int nextPageNumber = 0;
//   int numItems = 0;
//   dynamic lastResponse;
//
//   ApiPagingParams({
//     required this.nextPageNumber,
//     required this.numItems,
//     required this.lastResponse,
//   });
//
//   @override
//   String toString() =>
//       'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
// }
//
// String _toEncodable(dynamic item) {
//   if (item is DocumentReference) {
//     return item.path;
//   }
//   return item;
// }
//
// String _serializeList(List? list) {
//   list ??= <String>[];
//   try {
//     return json.encode(list, toEncodable: _toEncodable);
//   } catch (_) {
//     if (kDebugMode) {
//       print("List serialization failed. Returning empty list.");
//     }
//     return '[]';
//   }
// }
//
// String _serializeJson(dynamic jsonVar, [bool isList = false]) {
//   jsonVar ??= (isList ? [] : {});
//   try {
//     return json.encode(jsonVar, toEncodable: _toEncodable);
//   } catch (_) {
//     if (kDebugMode) {
//       print("Json serialization failed. Returning empty json.");
//     }
//     return isList ? '[]' : '{}';
//   }
// }
