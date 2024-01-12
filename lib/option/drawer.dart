import 'package:flutter/material.dart';

class DrawerGenerator extends StatefulWidget {
  const DrawerGenerator({super.key});

  @override
  State<DrawerGenerator> createState() => _DrawerGeneratorState();
}

class _DrawerGeneratorState extends State<DrawerGenerator> {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
