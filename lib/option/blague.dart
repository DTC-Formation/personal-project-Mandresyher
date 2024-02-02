import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lastprojects/information/blagues.dart';
import 'package:lastprojects/information/cat%C3%A9gorie.dart';
import 'package:lastprojects/option/option_avanc%C3%A9/favorite_provider.dart';
import 'package:provider/provider.dart';

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
      // backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.categoryName.toUpperCase(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(50.0, 50.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icon/1.png'), fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: categoryBlagues.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: categoryBlagues[index].isFavorite
                        ? Colors.white
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                    //Affichage du contenue des blagues
                    title: Text(categoryBlagues[index].name),
                    subtitle: Text(categoryBlagues[index].contenues),
                    //l'icon coeur a coté
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<FavoriteProvider>()
                            .toggleIsLiked(categoryBlagues[index]);
                        setState(
                          () {
                            categoryBlagues[index].isFavorite =
                                !categoryBlagues[index].isFavorite;
                            context
                                .read<FavoriteProvider>()
                                .toggleIsLiked(categoryBlagues[index]);
                          },
                        );
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(30, 30),
                      ),
                      iconSize: 20,
                      icon: context
                              .read<FavoriteProvider>()
                              .isBlagueLiked(categoryBlagues[index])
                          ? Icon(Iconsax.heart5, color: Colors.red)
                          : Icon(
                              Iconsax.heart,
                            ),
                    ),
                    //  IconButton(
                    //   icon: Icon(
                    //     context
                    //             .read<FavoriteProvider>()
                    //             .isBlagueLiked(categoryBlagues[index])
                    //         ? Icons.favorite
                    //         : Icons.favorite,
                    //     size: 24.0,
                    //     color: context
                    //             .read<FavoriteProvider>()
                    //             .isBlagueLiked(categoryBlagues[index])
                    //         ? Colors.red
                    //         : Colors.grey,
                    //   ),
                    //   onPressed: () {
                    //     context
                    //         .read<FavoriteProvider>()
                    //         .toggleIsLiked(categoryBlagues[index]);
                    //     setState(() {
                    //       categoryBlagues[index].isFavorite =
                    //           !categoryBlagues[index].isFavorite;
                    //     });
                    //   },
                    // ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
