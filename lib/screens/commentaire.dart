import 'package:flutter/material.dart';
import 'package:lastprojects/option/option_avanc%C3%A9/data_base.dart';

class Comment {
  int id;
  String author;
  String content;

  Comment({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      author: map['author'],
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'content': content,
    };
  }
}

class MyCommesPage extends StatefulWidget {
  @override
  _MyCommesPageState createState() => _MyCommesPageState();
}

class _MyCommesPageState extends State<MyCommesPage> {
  String generateCommentId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  List<Comment> comments = [];

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Commentaires'),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            fixedSize: Size(50.0, 50.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.instance.getComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          } else {
            comments = snapshot.data!
                .map((commentMap) => Comment.fromMap(commentMap))
                .toList();
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return _buildCommentBox(comments[index], index);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCommentDialog();
        },
        child: Icon(Icons.comment),
      ),
    );
  }

  Widget _buildCommentBox(Comment comment, int index) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.author,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(comment.content),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _deleteComment(comment.id.toString(), index);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _deleteComment(String commentId, int index) {
    setState(() {
      comments.removeAt(index);
      DatabaseHelper.instance.deleteComment(commentId);
    });
  }

  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String commentId = generateCommentId();
        return AlertDialog(
          title: Text("Que pensez-vous de l'application?"),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Votre commentaire'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                String comment = commentController.text;
                if (comment.isNotEmpty) {
                  Comment newComment = Comment(
                    id: int.parse(commentId),
                    author: '',
                    content: comment,
                  );

                  await DatabaseHelper.instance
                      .insertComment(newComment.toMap());

                  setState(() {
                    comments.add(newComment);
                    commentController.clear();
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }
}
