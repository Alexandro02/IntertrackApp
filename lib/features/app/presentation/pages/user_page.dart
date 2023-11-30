import 'package:intertrack/features/app/presentation/screens/speech_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRAKE Popup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pagina de usuarios.",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SpeechScreen(),
                  ),
                );
              },
              child: Text("Abrir Pantalla de Reconocimiento de Voz"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Unidad detenida con éxito'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('¡Entendido!'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Parar unidad'),
            ),
          ],
        ),
      ),
    );
  }
}
