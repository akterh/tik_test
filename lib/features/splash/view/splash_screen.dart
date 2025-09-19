import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/app_dependency.dart';
import '../../../../core/app/app_preference.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/routes.dart';
import '../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  final AppPreferences _appPreferences;

  SplashScreen({super.key}) : _appPreferences = instance.get();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      _timer = Timer(const Duration(seconds: 2), _navigateNext);
    });
  }

  void _navigateNext() {
    if (!mounted) return;

    final isLoggedIn = widget._appPreferences.isUserLoggedIn();
    Navigator.pushNamedAndRemoveUntil(
      context,
      isLoggedIn ? Routes.dashboard : Routes.dashboard,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
