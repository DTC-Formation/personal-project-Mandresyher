class Joke {
  int id;
  final String author;
  final String content;

  Joke({
    required this.id,
    required this.author,
    required this.content,
  });
}

class JokeManager {
  static List<Joke> jokes = [];

  static void addJoke(int id, String author, String content) {
    jokes.add(Joke(id: id, author: author, content: content));
  }

  static void removeJoke(int index) {
    jokes.removeAt(index);
  }
}
