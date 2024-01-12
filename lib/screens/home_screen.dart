import 'package:flutter/material.dart';
import 'package:lastprojects/option/design_barrederecherche.dart';
import 'package:lastprojects/option/drawer.dart';
import 'package:lastprojects/option/categories_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["Adulte", "Adolescent", "Enfant", "Spécial"];
  final List<String> categoryImages = [
    'assets/fond/Adulte.jpg',
    'assets/fond/Adolescent.jpg',
    'assets/fond/Enfant.png',
    'assets/fond/Special.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerGenerator(),
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
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                child: Image.asset("assets/fond/Blog.png"),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(10.0),
              child: BarreDeRecherche(),
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
      ),
    );
  }
}
