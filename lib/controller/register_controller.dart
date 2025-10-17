import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Controladores para acessar os valores dos campos
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Valida o formulário e simula o cadastro do usuário.
  void register(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      // Simula uma chamada de API
      Future.delayed(const Duration(seconds: 1), () {
        _setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro (simulado) com sucesso!')),
        );
        // Opcional: navegar para a tela de login ou home
        Navigator.of(context).pop();
      });
    }
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  @override
  void dispose() {
    // Limpa todos os controladores
    [nameController, dobController, emailController, phoneController, passwordController, confirmPasswordController]
        .forEach((controller) => controller.dispose());
    super.dispose();
  }
}