import 'package:flutter/material.dart';

import 'package:lastprojects/option/bottombar_design.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNBar(),
      body: Container(),
    );
  }
}
