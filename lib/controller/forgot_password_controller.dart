import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void sendPasswordResetEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      // 1. Simula envio de um e-mail de recuperação.
      Future.delayed(const Duration(seconds: 1), () {
        _setLoading(false);
        // USO DE SNACKBAR
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Link de recuperação enviado para o seu e-mail.'),
            backgroundColor: Colors.green,
          ),
        );

        // 2. Volta para a tela de login após um pequeno atraso.
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) Navigator.of(context).pop();
        });
      });
    }
  }
}