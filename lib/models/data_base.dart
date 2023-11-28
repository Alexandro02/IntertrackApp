import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'user.dart';

class Database {
  Future<void> init() async {
    await rootBundle.loadString('assets/userData.json');
  }

  // Get all users from db
  Future<List<User>> getUsers() async {
    final file = File('assets/userData.json');
    final contents = await file.readAsString();
    final jsonData = json.decode(contents) as List;
    return jsonData
        .map((user) => User(
              id: user['id'],
              username: user['username'],
              password: user['password'],
            ))
        .toList();
  }

  // Add user to db
  Future<void> addUser(User user) async {
    final file = File('assets/userData.json');
    final contents = await file.readAsString();
    final jsonData = json.decode(contents) as List;
    jsonData.add(user.toMap());
    await file.writeAsString(json.encode(jsonData));
  }
}
