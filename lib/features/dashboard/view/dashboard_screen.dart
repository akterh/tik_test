import 'package:flutter/material.dart';


import '../../home/view/repository_home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryHomeScreen(),
      extendBody: true,
    );
  }
}
