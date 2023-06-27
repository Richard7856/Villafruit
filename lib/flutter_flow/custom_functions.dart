import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double subverde(
  int qty,
  double price,
) {
  return qty * price;
}

double subnormal(
  int qty,
  double price,
) {
  return qty * price;
}

double sumaduro(
  int qty,
  double price,
) {
  return qty * price;
}

double subtotal(
  double subverde,
  double submaduro,
  double subnormal,
) {
  return subverde + subnormal + submaduro;
}

int cantidad(
  int ver,
  int med,
  int mad,
) {
  return ver + med + mad;
}

double subt(
  int qty,
  double price,
) {
  return qty * price;
}

int dif(
  int one,
  int two,
) {
  return one - two;
}
