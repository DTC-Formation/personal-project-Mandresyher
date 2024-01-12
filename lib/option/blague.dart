import 'package:flutter/material.dart';
import 'package:lastprojects/information/blagues.dart';
import 'package:lastprojects/information/cat%C3%A9gorie.dart';

class BlaguePage extends StatefulWidget {
  final String categoryName;

  BlaguePage({
    required this.categoryName,
    required this.index,
  });
  final int index;

  @override
  State<BlaguePage> createState() => _BlaguePageState();
}

class _BlaguePageState extends State<BlaguePage> {
  late List<Blague> categoryBlagues;

  @override
  void initState() {
    super.initState();
    categoryBlagues = blagues
        .where((blague) => blague.categories == widget.categoryName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Blague> categoryBlagues = blagues
        .where((blague) => blague.categories == categories[widget.index])
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: ListView.builder(
        itemCount: categoryBlagues.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryBlagues[index].name),
            subtitle: Text(categoryBlagues[index].contenues),
            trailing: IconButton(
              icon: Icon(
                categoryBlagues[index].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  categoryBlagues[index].isFavorite =
                      !categoryBlagues[index].isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
