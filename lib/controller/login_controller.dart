import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Controladores para os campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Tenta fazer o login e navega para a home se for bem-sucedido.
  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      // Simula uma chamada de API
      Future.delayed(const Duration(seconds: 1), () {
        _setLoading(false);
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}