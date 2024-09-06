import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Widget envBannerWrap(
    {required Widget? child,
    String? label = '',
    Color? color = Colors.green,
    BannerLocation? location = BannerLocation.topStart,
    bool? visible = true}) {
  if (visible == true) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Banner(
        location: location ?? BannerLocation.topStart,
        message: label ?? '',
        color: color ?? Colors.green,
        textStyle: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
        child: child,
      ),
    );
  } else {
    return child ?? const SizedBox();
  }
}
