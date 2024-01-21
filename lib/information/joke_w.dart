class UserJoke {
  int id;
  String username;
  String joke;

  UserJoke({
    required this.id,
    required this.username,
    required this.joke,
  });

  factory UserJoke.fromMap(Map<String, dynamic> map) {
    return UserJoke(
      id: int.parse(map['id']),
      username: map['username'],
      joke: map['joke'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'joke': joke,
    };
  }
}
