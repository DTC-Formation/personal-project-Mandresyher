import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lastprojects/information/cat%C3%A9gorie.dart';

import '../../information/blagues.dart';

class Joke {
  final String setup;
  final String delivery;
  final String joke;

  Joke({
    required this.setup,
    required this.delivery,
    required this.joke,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'twopart') {
      return Joke(
        setup: json['setup'],
        delivery: json['delivery'],
        joke: '${json['setup']} ${json['delivery']}',
      );
    } else {
      return Joke(
        setup: '',
        delivery: '',
        joke: json['joke'],
      );
    }
  }
}

class JokeApi {
  static Future<List<Blague>> getProgrammingJokes({int count = 10}) async {
    final response = await http.get(Uri.parse(
        'https://v2.jokeapi.dev/joke/Any?type=twopart&amount=$count'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['jokes'];
      print(data);

      // Liste return
      List<Blague> apiBlagues = data.map((joke) {
        return Blague(
          name: joke['setup'] ?? '1',
          contenues: joke['delivery'] ?? '1',
          categories: categories[3], // Remplacez par la catégorie appropriée
        );
      }).toList();

      // Ajoutez les blagues de la catégorie 3 à la liste existante
      blagues.addAll(apiBlagues);

      return apiBlagues;
    } else {
      print(Exception);
      throw Exception('Impossible de récupérer les blagues.');
    }
  }
}
