import 'package:flutter/material.dart';

class SelfReflectionController extends ChangeNotifier {
  // Lista de perguntas de exemplo (prompts que posteriormente serão feitos por IA)
  final List<String> prompts = [
    "O que te trouxe alegria hoje, por menor que seja?",
    "Qual foi o maior desafio que você enfrentou hoje e como lidou com ele?",
    "Pelo que você se sente grato(a) neste momento?",
    "Se você pudesse dar um conselho para si mesmo(a) no início do dia, qual seria?",
    "Qual pequena ação você pode tomar amanhã para se aproximar de um objetivo seu?",
  ];

  // Controllers para cada campo de texto
  late final List<TextEditingController> controllers;

  SelfReflectionController() {
    _initializeControllers();
  }

  void _initializeControllers() {
    controllers = List.generate(prompts.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    // Limpa todos os controllers quando o controller principal for descartado.
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}