import 'package:flutter/material.dart';

class BarreDeRecherche extends StatefulWidget {
  const BarreDeRecherche({Key? key}) : super(key: key);

  @override
  State<BarreDeRecherche> createState() => _BarreDeRechercheState();
}

class _BarreDeRechercheState extends State<BarreDeRecherche> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          border: InputBorder.none,
          hintText: "Recherche des blagues",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
              });
            },
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
