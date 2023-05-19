import 'package:flutter/material.dart';
import 'package:qoway/l10n/l10n.dart';

String shortMonth(int dateUnix, BuildContext context) {
  final fecha = DateTime.fromMillisecondsSinceEpoch(dateUnix).toString();
  final month = int.parse(fecha.substring(5, 7));
  final l10n = context.l10n;
  switch (month) {
    case 1:
      return l10n.january;
    case 2:
      return l10n.february;
    case 3:
      return l10n.march;
    case 4:
      return l10n.april;
    case 5:
      return l10n.may;
    case 6:
      return l10n.june;
    case 7:
      return l10n.july;
    case 8:
      return l10n.august;
    case 9:
      return l10n.september;
    case 10:
      return l10n.october;
    case 11:
      return l10n.november;
    case 12:
      return l10n.december;
    default:
      return 'Err';
  }
}

String dayOfMonth(int dateUnix) {
  final fecha = DateTime.fromMillisecondsSinceEpoch(dateUnix).toString();
  final day = fecha.substring(8, 10);
  return day;
}
