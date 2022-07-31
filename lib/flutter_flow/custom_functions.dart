import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getDocumentId(DocumentReference docRef) {
  // Add your function code here!
  return docRef.id;
}

String geoPointToString(LatLng geoPoint) {
  // convert input LatLng type to string type
  return '${geoPoint.latitude},${geoPoint.longitude}';
}

String secsToHrsMins(double num) {
  var h = num >= 3600 ? (num / 3600).floor() : 0;
  var m = num % 3600 ~/ 60;
  return h > 0 ? "$h Hours & $m mins" : "$m mins";
}

String trimmingOptions1(String option) {
  return option.split(".")[0].substring(2);
}

String trimmingOptions2(String option) {
  return option.split(".")[0];
}

List<String> populateSubDrops(
  List<String> list,
  String match,
) {
  String nmatch = match.split(" ")[2].substring(1, 3);
  List<String> filtered = [];
  list.forEach((el) {
    if (el.startsWith(nmatch)) {
      filtered.add(el);
    }
  });
  return filtered;
}
