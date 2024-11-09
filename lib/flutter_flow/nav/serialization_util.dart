// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:from_css_color/from_css_color.dart';
//
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
//
// import '../../flutter_flow/lat_lng.dart';
// import '../../flutter_flow/place.dart';
// import '../../flutter_flow/uploaded_file.dart';
//
// import 'package:debug_panel_proto/debug_panel_proto.dart';
//
// /// SERIALIZATION HELPERS
//
// String dateTimeRangeToString(DateTimeRange dateTimeRange) {
//   final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
//   final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
//   return '$startStr|$endStr';
// }
//
// String placeToString(FFPlace place) => jsonEncode({
//       'latLng': place.latLng.serialize(),
//       'name': place.name,
//       'address': place.address,
//       'city': place.city,
//       'state': place.state,
//       'country': place.country,
//       'zipCode': place.zipCode,
//     });
//
// String uploadedFileToString(FFUploadedFile uploadedFile) =>
//     uploadedFile.serialize();
//
// const _kDocIdDelimeter = '|';
// String _serializeDocumentReference(DocumentReference ref) {
//   final docIds = <String>[];
//   DocumentReference? currentRef = ref;
//   while (currentRef != null) {
//     docIds.add(currentRef.id);
//     // Get the parent document (catching any errors that arise).
//     currentRef = safeGet<DocumentReference?>(() => currentRef?.parent.parent);
//   }
//   // Reverse the list to get the correct ordering.
//   return docIds.reversed.join(_kDocIdDelimeter);
// }
//
// String? serializeParam(
//   dynamic param,
//   ParamType paramType, {
//   bool isList = false,
// }) {
//   try {
//     if (param == null) {
//       return null;
//     }
//     if (isList) {
//       final serializedValues = (param as Iterable)
//           .map((p) => serializeParam(p, paramType, isList: false))
//           .where((p) => p != null)
//           .map((p) => p!)
//           .toList();
//       return json.encode(serializedValues);
//     }
//     String? data;
//     switch (paramType) {
//       case ParamType.int:
//         data = param.toString();
//       case ParamType.double:
//         data = param.toString();
//       case ParamType.String:
//         data = param;
//       case ParamType.bool:
//         data = param ? 'true' : 'false';
//       case ParamType.DateTime:
//         data = (param as DateTime).millisecondsSinceEpoch.toString();
//       case ParamType.DateTimeRange:
//         data = dateTimeRangeToString(param as DateTimeRange);
//       case ParamType.LatLng:
//         data = (param as LatLng).serialize();
//       case ParamType.Color:
//         data = (param as Color).toCssString();
//       case ParamType.FFPlace:
//         data = placeToString(param as FFPlace);
//       case ParamType.FFUploadedFile:
//         data = uploadedFileToString(param as FFUploadedFile);
//       case ParamType.JSON:
//         data = json.encode(param);
//       case ParamType.DocumentReference:
//         data = _serializeDocumentReference(param as DocumentReference);
//       case ParamType.Document:
//         final reference = (param as FirestoreRecord).reference;
//         data = _serializeDocumentReference(reference);
//
//       case ParamType.DataStruct:
//         data = param is BaseStruct ? param.serialize() : null;
//
//       case ParamType.Enum:
//         data = (param is Enum) ? param.serialize() : null;
//
//       default:
//         data = null;
//     }
//     return data;
//   } catch (e) {
//     print('Error serializing parameter: $e');
//     return null;
//   }
// }
//
// DebugDataField debugSerializeParam(
//   dynamic param,
//   ParamType paramType, {
//   bool isList = false,
//   String? link,
//   String? searchReference,
//   String? name,
//   bool? nullable,
// }) {
//   try {
//     if (isList) {
//       final values = (param as Iterable?)
//           ?.map((p) => debugSerializeParam(
//                 p,
//                 paramType,
//                 isList: false,
//               ))
//           .toList();
//       return DebugDataField(
//         type: _kParamTypeProtoMap[paramType],
//         listValue: ListDebugDataField(values: values),
//         link: link,
//         searchReference: searchReference,
//         name: name,
//         nullable: nullable,
//       );
//     }
//     String? data;
//     var type = _kParamTypeProtoMap[paramType];
//     if (param != null) {
//       switch (paramType) {
//         case ParamType.int:
//           data = param.toString();
//         case ParamType.double:
//           data = param.toString();
//         case ParamType.String:
//           data = param;
//         case ParamType.bool:
//           data = param ? 'true' : 'false';
//         case ParamType.DateTime:
//           data = (param as DateTime).millisecondsSinceEpoch.toString();
//         case ParamType.DateTimeRange:
//           data = dateTimeRangeToString(param as DateTimeRange);
//         case ParamType.LatLng:
//           data = (param as LatLng).serialize();
//         case ParamType.Color:
//           data = (param as Color).toCssString();
//         case ParamType.FFPlace:
//           data = placeToString(param as FFPlace);
//         case ParamType.FFUploadedFile:
//           data = uploadedFileToString(param as FFUploadedFile);
//         case ParamType.JSON:
//           data = json.encode(param);
//         case ParamType.DocumentReference:
//           data = _serializeDocumentReference(param as DocumentReference);
//         case ParamType.Document:
//           return DebugDataField(
//             type: DebugDataField_ParamType.DOCUMENT,
//             mapValue: MapDebugDataField(
//               values: param.toDebugSerializableMap(),
//             ),
//             link: link,
//             searchReference: searchReference,
//             name: name,
//             nullable: nullable,
//           );
//
//         case ParamType.DataStruct:
//           if (param is BaseStruct) {
//             return DebugDataField(
//               type: DebugDataField_ParamType.DATA_STRUCT,
//               mapValue: MapDebugDataField(
//                 values: param.toDebugSerializableMap(),
//               ),
//               link: link,
//               searchReference: searchReference,
//               name: name,
//               nullable: nullable,
//             );
//           } else {
//             return DebugDataField();
//           }
//
//         case ParamType.Enum:
//           data = (param is Enum) ? param.serialize() : null;
//
//         case ParamType.Action:
//         case ParamType.Widget:
//           data = param.runtimeType.toString();
//         case ParamType.ApiResponse:
//           return DebugDataField(
//             type: DebugDataField_ParamType.DATA_STRUCT,
//             mapValue: MapDebugDataField(
//               values: {
//                 'statusCode':
//                     debugSerializeParam(param.statusCode, ParamType.int),
//                 'body': debugSerializeParam(param.bodyText, ParamType.String),
//               },
//             ),
//             link: link,
//             name: name,
//             nullable: nullable,
//           );
//         default:
//           data = null;
//       }
//     }
//     return DebugDataField(
//       serializedValue: data,
//       type: type,
//       link: link,
//       searchReference: searchReference,
//       name: name,
//       nullable: nullable,
//     );
//   } catch (e) {
//     print('Error debug serializing parameter: $e');
//     return DebugDataField();
//   }
// }
//
// /// END SERIALIZATION HELPERS
//
// /// DESERIALIZATION HELPERS
//
// DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
//   final pieces = dateTimeRangeStr.split('|');
//   if (pieces.length != 2) {
//     return null;
//   }
//   return DateTimeRange(
//     start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
//     end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
//   );
// }
//
// LatLng? latLngFromString(String? latLngStr) {
//   final pieces = latLngStr?.split(',');
//   if (pieces == null || pieces.length != 2) {
//     return null;
//   }
//   return LatLng(
//     double.parse(pieces.first.trim()),
//     double.parse(pieces.last.trim()),
//   );
// }
//
// FFPlace placeFromString(String placeStr) {
//   final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
//   final data = {
//     'latLng': serializedData.containsKey('latLng')
//         ? latLngFromString(serializedData['latLng'] as String)
//         : const LatLng(0.0, 0.0),
//     'name': serializedData['name'] ?? '',
//     'address': serializedData['address'] ?? '',
//     'city': serializedData['city'] ?? '',
//     'state': serializedData['state'] ?? '',
//     'country': serializedData['country'] ?? '',
//     'zipCode': serializedData['zipCode'] ?? '',
//   };
//   return FFPlace(
//     latLng: data['latLng'] as LatLng,
//     name: data['name'] as String,
//     address: data['address'] as String,
//     city: data['city'] as String,
//     state: data['state'] as String,
//     country: data['country'] as String,
//     zipCode: data['zipCode'] as String,
//   );
// }
//
// FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
//     FFUploadedFile.deserialize(uploadedFileStr);
//
// DocumentReference _deserializeDocumentReference(
//   String refStr,
//   List<String> collectionNamePath,
// ) {
//   var path = '';
//   final docIds = refStr.split(_kDocIdDelimeter);
//   for (int i = 0; i < docIds.length && i < collectionNamePath.length; i++) {
//     path += '/${collectionNamePath[i]}/${docIds[i]}';
//   }
//   return FirebaseFirestore.instance.doc(path);
// }
//
// enum ParamType {
//   int,
//   double,
//   String,
//   bool,
//   DateTime,
//   DateTimeRange,
//   LatLng,
//   Color,
//   FFPlace,
//   FFUploadedFile,
//   JSON,
//   Action,
//   Widget,
//   ApiResponse,
//   Document,
//   DocumentReference,
//   DataStruct,
//   Enum,
// }
//
// const _kParamTypeProtoMap = {
//   ParamType.int: DebugDataField_ParamType.INT,
//   ParamType.double: DebugDataField_ParamType.DOUBLE,
//   ParamType.String: DebugDataField_ParamType.STRING,
//   ParamType.bool: DebugDataField_ParamType.BOOL,
//   ParamType.DateTime: DebugDataField_ParamType.DATE_TIME,
//   ParamType.DateTimeRange: DebugDataField_ParamType.DATE_TIME_RANGE,
//   ParamType.LatLng: DebugDataField_ParamType.LAT_LNG,
//   ParamType.Color: DebugDataField_ParamType.COLOR,
//   ParamType.FFPlace: DebugDataField_ParamType.FF_PLACE,
//   ParamType.FFUploadedFile: DebugDataField_ParamType.FF_UPLOADED_FILE,
//   ParamType.JSON: DebugDataField_ParamType.JSON,
//   ParamType.Action: DebugDataField_ParamType.ACTION,
//   ParamType.Widget: DebugDataField_ParamType.WIDGET,
//   ParamType.Document: DebugDataField_ParamType.DOCUMENT,
//   ParamType.DocumentReference: DebugDataField_ParamType.DOCUMENT_REFERENCE,
//   ParamType.DataStruct: DebugDataField_ParamType.DATA_STRUCT,
//   ParamType.Enum: DebugDataField_ParamType.ENUM,
// };
//
// dynamic deserializeParam<T>(
//   String? param,
//   ParamType paramType,
//   bool isList, {
//   List<String>? collectionNamePath,
//   StructBuilder<T>? structBuilder,
// }) {
//   try {
//     if (param == null) {
//       return null;
//     }
//     if (isList) {
//       final paramValues = json.decode(param);
//       if (paramValues is! Iterable || paramValues.isEmpty) {
//         return null;
//       }
//       return paramValues
//           .where((p) => p is String)
//           .map((p) => p as String)
//           .map((p) => deserializeParam<T>(
//                 p,
//                 paramType,
//                 false,
//                 collectionNamePath: collectionNamePath,
//                 structBuilder: structBuilder,
//               ))
//           .where((p) => p != null)
//           .map((p) => p! as T)
//           .toList();
//     }
//     switch (paramType) {
//       case ParamType.int:
//         return int.tryParse(param);
//       case ParamType.double:
//         return double.tryParse(param);
//       case ParamType.String:
//         return param;
//       case ParamType.bool:
//         return param == 'true';
//       case ParamType.DateTime:
//         final milliseconds = int.tryParse(param);
//         return milliseconds != null
//             ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
//             : null;
//       case ParamType.DateTimeRange:
//         return dateTimeRangeFromString(param);
//       case ParamType.LatLng:
//         return latLngFromString(param);
//       case ParamType.Color:
//         return fromCssColor(param);
//       case ParamType.FFPlace:
//         return placeFromString(param);
//       case ParamType.FFUploadedFile:
//         return uploadedFileFromString(param);
//       case ParamType.JSON:
//         return json.decode(param);
//       case ParamType.DocumentReference:
//         return _deserializeDocumentReference(param, collectionNamePath ?? []);
//
//       case ParamType.DataStruct:
//         final data = json.decode(param) as Map<String, dynamic>? ?? {};
//         return structBuilder != null ? structBuilder(data) : null;
//
//       case ParamType.Enum:
//         return deserializeEnum<T>(param);
//
//       default:
//         return null;
//     }
//   } catch (e) {
//     print('Error deserializing parameter: $e');
//     return null;
//   }
// }
//
// Future<dynamic> Function(String) getDoc(
//   List<String> collectionNamePath,
//   RecordBuilder recordBuilder,
// ) {
//   return (String ids) => _deserializeDocumentReference(ids, collectionNamePath)
//       .get()
//       .then((s) => recordBuilder(s));
// }
//
// Future<List<T>> Function(String) getDocList<T>(
//   List<String> collectionNamePath,
//   RecordBuilder<T> recordBuilder,
// ) {
//   return (String idsList) {
//     List<String> docIds = [];
//     try {
//       final ids = json.decode(idsList) as Iterable;
//       docIds = ids.where((d) => d is String).map((d) => d as String).toList();
//     } catch (_) {}
//     return Future.wait(
//       docIds.map(
//         (ids) => _deserializeDocumentReference(ids, collectionNamePath)
//             .get()
//             .then((s) => recordBuilder(s)),
//       ),
//     ).then((docs) => docs.where((d) => d != null).map((d) => d!).toList());
//   };
// }
