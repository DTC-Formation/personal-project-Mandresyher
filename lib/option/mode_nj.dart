import 'package:flutter/material.dart';
import 'package:lastprojects/option/provider.dart';
import 'package:provider/provider.dart';

class YourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      theme: appProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              ListTile(
                title: Text('Mode'),
                trailing: Switch(
                  value: appProvider.isDarkMode,
                  onChanged: (value) {
                    appProvider.isDarkMode = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
