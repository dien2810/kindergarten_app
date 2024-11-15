// import 'dart:convert';
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'lat_lng.dart';
// import 'place.dart';
// import 'uploaded_file.dart';
// import '/backend/backend.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// // import '/auth/firebase_auth/auth_util.dart';
//
// DateTime? convertStringToDateTime(String stringDate) {
//   DateTime date = DateTime.parse(stringDate);
//
//   return date;
// }
//
// double calculateCartTotals(
//   List<ItemsStruct> items,
//   CartPriceType cartPriceType,
// ) {
//   // check if cartPricetype enum == discount, then iterate through items and add all items.discount?
//   if (cartPriceType == CartPriceType.discount) {
//     double totalDiscount = 0.0;
//
//     items.forEach((element) {
//       totalDiscount += element.price.discount;
//     });
//     return totalDiscount;
//   } else if (cartPriceType == CartPriceType.subTotal) {
//     double subTotal = 0.0;
//
//     items.forEach((element) {
//       subTotal += element.price.amount * element.quantity;
//     });
//     return subTotal;
//   } else if (cartPriceType == CartPriceType.totalCost) {
//     double subTotal = calculateCartTotals(items, CartPriceType.subTotal);
//     double discount = calculateCartTotals(items, CartPriceType.discount);
//     return subTotal - discount;
//   } else {
//     return 0.0;
//   }
// }
//
// double calculateTotalWithCoupon(
//   CouponsRecord? appliedCoupon,
//   List<ItemsStruct> items,
// ) {
//   double subTotal = calculateCartTotals(items, CartPriceType.subTotal);
//   double discount = calculateCartTotals(items, CartPriceType.discount);
//   // calculateTotalWithCouponCode of percentage
//   double total = subTotal;
//
//   total -= discount;
//
//   if (appliedCoupon != null) {
//     if (appliedCoupon.discountType == DiscountType.percentage) {
//       total *= (1 - appliedCoupon.value / 100);
//     } else if (appliedCoupon.discountType == DiscountType.fixed) {
//       total -= appliedCoupon.value;
//     }
//   }
//   return double.parse(total.toStringAsFixed(2));
// }
//
// bool checkIfProductIdExistsInCart(
//   List<ItemsStruct> cartItems,
//   String productId,
// ) {
//   return cartItems.any((item) => item.productId == productId);
// }
