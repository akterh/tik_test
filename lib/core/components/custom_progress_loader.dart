import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_tik/generated/assets.dart';

import '../constants/app_colors.dart';

void showProgressDialog() {
  if (!EasyLoading.isShow) EasyLoading.show(dismissOnTap: false);
}

void dismissProgressDialog() {
  if (EasyLoading.isShow) EasyLoading.dismiss();
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskColor = Colors.transparent
    ..textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
    )
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..boxShadow = []
    ..indicatorWidget = CircularProgressIndicator(color: Colors.black,);
}
