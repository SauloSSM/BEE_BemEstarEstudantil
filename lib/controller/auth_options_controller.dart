import 'package:flutter/material.dart';

class AuthOptionsController {
  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }

  void navigateToRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }
}