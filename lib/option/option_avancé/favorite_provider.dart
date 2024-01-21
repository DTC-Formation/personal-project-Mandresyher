import 'package:flutter/material.dart';
import 'package:lastprojects/information/blagues.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Blague> _blagues;

  FavoriteProvider(List<Blague> blagues) : _blagues = blagues;

  List<Blague> get blagues => _blagues;

  bool isBlagueLiked(Blague blague) {
    final int index = _blagues.indexOf(blague);
    return index != -1 ? _blagues[index].isFavorite : false;
  }

  void toggleIsLiked(Blague blague) {
    final int index = _blagues.indexOf(blague);
    if (index != -1) {
      _blagues[index].toggleLike();
      // _blagues[index].isFavorite = !_blagues[index].isFavorite;
      if (_blagues[index].isFavorite) {
        addToFavorites(_blagues[index]);
      } else {
        removeFromFavorites(blagues[index]);
      }

      notifyListeners();
    }
  }

  final List<Blague> _favoriteBlagues = [];

  List<Blague> get favoriteBlagues => _favoriteBlagues;

  void addToFavorites(Blague blague) {
    if (!_favoriteBlagues.contains(blague)) {
      _favoriteBlagues.add(blague);
      notifyListeners();
    }
  }

  void removeFromFavorites(Blague blague) {
    if (_favoriteBlagues.contains(blague)) {
      _favoriteBlagues.remove(blague);
      notifyListeners();
    }
  }
}
