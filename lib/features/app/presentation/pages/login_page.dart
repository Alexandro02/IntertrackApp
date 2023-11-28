import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intertrack/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  void login(String username, String password) async {
    // Read the JSON data from the file.
    final jsonData =
        await DefaultAssetBundle.of(context).loadString('assets/userData.json');

    // Decode the JSON data to a list of dynamic objects.
    final List<dynamic> jsonList = jsonDecode(jsonData);

    // Convert the list of dynamic objects to a list of maps.
    final List<Map<String, dynamic>> usersData =
        jsonList.map((json) => Map<String, dynamic>.from(json)).toList();

    // Iterate through the usersData list and check if the username and password match
    User? foundUser;
    for (final userData in usersData) {
      final user = User.fromJson(userData);
      if (user.username == username && user.password == password) {
        foundUser = user;
        break;
      }
    }

    if (foundUser != null) {
      setState(() {
        user = foundUser;
      });
    } else {
      // Show error message or use a snackbar to inform the user that the login failed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 131, 183, 218),
        child: Column(
          children: [
            Container(
              width: 600,
              height: 150,
              margin: EdgeInsets.all(10),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO2tWaSDPUixIf_4hByRtZ_tQxU435aTJ1v4GpZrbeY_tWn5JeJdUDAqX3I_UQcBEnaAE&usqp=CAU'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: const Text(
                "Usuario",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: UnderlineInputBorder(),
                labelText: "Ingresa tu usuario",
              ),
              style: TextStyle(fontSize: 14),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: const Text(
                "Contraseña",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: UnderlineInputBorder(),
                labelText: "Ingresa tu contraseña",
              ),
              style: TextStyle(fontSize: 14),
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Ingresar'),
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              color: Colors.black26,
              child: const Text(
                "Cerrar sesión",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
