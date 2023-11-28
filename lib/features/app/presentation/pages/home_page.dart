import 'package:intertrack/widgets/custom_pop_up.dart';
import 'package:intertrack/widgets/map.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
  // API for email sending.
  Future<void> sendNotification() async {
    const serviceId = 'service_aeszbsq';
    const templateId = 'template_gcu5ijm';
    const userId = 'gdf71SunnLlh_IAHx';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'origin': 'http://localhost'
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
        },
      ),
    );

    response.statusCode == 200
        ? print('Correo electrónico enviado con éxito')
        : print('Error al enviar el correo electrónico');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InterMap(),
      // Floating button to send notifications.
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.blue,
        tooltip: "Enviar notificacion a email.",
        onPressed: () async {
          // sendNotification is in charge of sending a notification when the button is pressed.
          await sendNotification();
          CustomPopUp(
              dialogTitle: "Correo enviado",
              dialogText: "El correo electrónico ha sido enviado exitosamente!",
              buttonText: "Aceptar");
        },
        child: Icon(Icons.notification_add),
      ),
    );
  }
}
