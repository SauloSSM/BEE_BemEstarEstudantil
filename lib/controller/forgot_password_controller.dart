import 'package:flutter/material.dart';

class ForgotPasswordController {
  void sendPasswordResetEmail(BuildContext context) {
    // 1. simuLa envio de um e-mail de recuperação.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link de recuperação enviado para o seu e-mail.'),
        backgroundColor: Colors.green,
      ),
    );

    // 2. volta para a tela de login após um pequeno atraso.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}