import 'package:flutter/material.dart';
import '../information/joke_w.dart';
import '../option/option_avancé/data_base.dart';

class WriteJokePage extends StatefulWidget {
  @override
  _WriteJokePageState createState() => _WriteJokePageState();
}

class _WriteJokePageState extends State<WriteJokePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController jokeController = TextEditingController();
  List<UserJoke> userJokes = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Écrit ta une Blague'),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Ecris ton pseudo',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: jokeController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Ajoute ta blague',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String jokeText = jokeController.text;
                    if (username.isNotEmpty && jokeText.isNotEmpty) {
                      int jokeId = DateTime.now().millisecondsSinceEpoch;
                      UserJoke newUserJoke = UserJoke(
                        id: jokeId,
                        username: username,
                        joke: jokeText,
                      );

                      await DatabaseHelper.instance
                          .insertUserJoke(newUserJoke.toMap());

                      setState(() {
                        userJokes.add(newUserJoke);
                        usernameController.clear();
                        jokeController.clear();
                      });
                    } else {
                      _showAlert(
                          "Remplissez tous les champs avant d'ajouter la blague.");
                    }
                  },
                  child: Text('Ajouter la Blague'),
                ),
                SizedBox(height: 16.0),
                Text('Rigolant Ensemble :'),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: DatabaseHelper.instance.getuserJoke(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else {
                    userJokes = snapshot.data!
                        .map((jokes) => UserJoke.fromMap(jokes))
                        .toList();
                    return ListView.builder(
                        itemCount: userJokes.length,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userJokes[index].username,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(userJokes[index].joke),
                                  SizedBox(height: 8.0),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          _deleteuserJoke(
                                              userJokes[index].id.toString(),
                                              index);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  }
                }),
          ),
        ],
      ),
    );
  }

  void _deleteuserJoke(String userJokesId, int index) {
    setState(() {
      userJokes.removeAt(index);
      DatabaseHelper.instance.deleteuserJoke(userJokesId);
    });
  }

  void _showAlert(String message) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
