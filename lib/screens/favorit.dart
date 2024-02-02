import 'package:flutter/material.dart';
import 'package:lastprojects/option/option_avanc%C3%A9/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';

class MyFavoritePage extends StatefulWidget {
  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.read<FavoriteProvider>();
    final favoriteBlagues = favoriteProvider.favoriteBlagues;

    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vos Favoris',
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
            image: AssetImage('assets/icon/2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: ListView.builder(
            itemCount: favoriteBlagues.length,
            itemBuilder: (context, index) {
              final blague = favoriteBlagues[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color:
                      blague.isFavorite ? Colors.white : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                child: ListTile(
                  title: Text(blague.name),
                  subtitle: Text(blague.contenues),
                  trailing: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          context
                              .read<FavoriteProvider>()
                              .removeFromFavorites(blague);
                        },
                      );
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(30, 30),
                    ),
                    iconSize: 20,
                    icon:
                        context.watch<FavoriteProvider>().isBlagueLiked(blague)
                            ? Icon(Iconsax.heart5, color: Colors.red)
                            : Icon(
                                Iconsax.heart,
                              ),
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     favoriteProvider.isBlagueLiked(blague)
                  //         ? Icons.favorite
                  //         : Icons.favorite_border,
                  //     color: Colors.red,
                  //   ),
                  //   onPressed: () {
                  //     favoriteProvider.toggleIsLiked(blague);

                  //   },
                  // ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
