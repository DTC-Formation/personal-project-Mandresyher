import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lastprojects/screens/commentaire.dart';
import 'package:lastprojects/screens/favorit.dart';
import 'package:lastprojects/screens/politique_confi.dart';

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
    return Scaffold(
      body: Container(
        // color: Colors.deepPurple.shade400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icon/6.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                child: Image.asset("assets/icon/Blog.png"),
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: Text('Vos Favoris'),
                        leading: Icon(Icons.favorite),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyFavoritePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: Text('commentaire'),
                        leading: Icon(Icons.comment),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCommesPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: Text('Politique de Confidentialité'),
                        leading: Icon(Icons.security),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PolitiquedeConfidentialite(),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
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
    );
  }
}
