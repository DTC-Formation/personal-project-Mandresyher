import 'dart:html';

import 'package:flutter/material.dart';

class CommentProvider with ChangeNotifier {
  final List<Comment> _likedComments = [];

  bool isCommentLiked(Comment comment) {
    return _likedComments.contains(comment);
  }

  void toggleIsCommentLiked(Comment comment) {
    if (_likedComments.contains(comment)) {
      _likedComments.remove(comment);
    } else {
      _likedComments.add(comment);
    }

    notifyListeners();
  }
}
