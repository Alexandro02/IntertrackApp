class User {
  final int id;
  final String username;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  // Convert the User object to a Map object.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'username': username,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['user_name'],
      password: json['password'],
    );
  }
}
