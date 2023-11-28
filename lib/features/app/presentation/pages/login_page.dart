import 'package:flutter/material.dart';
import 'package:intertrack/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;

  void login(String username, String password) async {
    // Simulación de autenticación.
    if (username == "usuario" && password == "contraseña") {
      // Usuario simulado. Puedes realizar la autenticación real aquí.
      final foundUser = User(username: username, password: password, id: 1); // Ahora 'id' es un entero

      setState(() {
        user = foundUser;
      });

      // Muestra un diálogo de bienvenida con el nombre de usuario
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Bienvenido'),
            content: Text('Inicio de sesión exitoso. ¡Bienvenido, $username!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo de bienvenida
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // se podria Mostrar un mensaje de error o utiliza un snackbar para informar al usuario que el inicio de sesión falló
    }
  }

  void logout() {
    // Muestra un diálogo de despedida
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nos vemos después'),
          content: const Text('Cierre de sesión exitoso. ¡Hasta luego!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo de despedida
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
              onPressed: () {
                // Llama a la función de inicio de sesión
                login("usuario", "contraseña");
              },
              child: const Text('Ingresar'),
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              color: Colors.black26,
              child: ElevatedButton(
                onPressed: () {
                  // Llama a la función de cierre de sesión
                  logout();
                },
                child: const Text('Cerrar sesión'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
