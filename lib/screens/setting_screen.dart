import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../option/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Map<String, bool> optionStates = {
    'Option 1': false,
    'Option 2': false,
    'Option 3': false,
  };
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/88/36/e6/8836e61e8b4a2c12430c88ed79f3f208.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  child: Image.asset("assets/fond/Blog.png"),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: ListView(
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
                      Divider(),
                      ListTile(
                        title: Text('Option 1'),
                        leading: Icon(Icons.settings),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Option 2'),
                        leading: Icon(Icons.person),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Option 3'),
                        leading: Icon(Icons.security),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text('Quitter'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
