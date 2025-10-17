import 'package:flutter/material.dart';

class SplashController {
  /// Navega para a próxima tela após um tempo de espera.
  void initialize(BuildContext context) {
    // aguarda 3 segundos para simular um carregamento
    Future.delayed(const Duration(seconds: 3)).then((_) {
      // Navega para a tela principal e remove a tela de splash da pilha
      // para que o usuário não possa voltar para ela.
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
}
