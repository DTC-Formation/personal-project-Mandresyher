import 'package:flutter/material.dart';
import 'package:lastprojects/option/design/categories_box.dart';
import 'package:lastprojects/screens/ecris_b.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "Adulte",
    "Adolescent",
    "Enfant",
    "Spécial",
    // "Ajout",
  ];
  final List<String> categoryImages = [
    'assets/fond/Adulte.png',
    'assets/fond/Ado.png',
    'assets/fond/Enfant.png',
    'assets/fond/Special.png',
    // 'assets/fond/Ajout.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icon/6.png'),
            fit: BoxFit.cover,
          ),
        ),
        // color: Colors.deepPurple.shade400,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Container(
              child: Image.asset("assets/icon/Blog.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(0.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoriesBox(
                  categoryName: categories[index],
                  imagePath: categoryImages[index],
                  index: index,
                );
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50.0, bottom: 0.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            _showConfirmationDialog(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tu as une blague?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Non'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToWriteJokePage(context);
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToWriteJokePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WriteJokePage(),
      ),
    );
  }
}
