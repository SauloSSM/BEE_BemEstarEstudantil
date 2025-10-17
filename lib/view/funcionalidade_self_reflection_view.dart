import 'package:flutter/material.dart';

class FuncionalidadeSelfReflectionView extends StatefulWidget {
  const FuncionalidadeSelfReflectionView({super.key});

  @override
  State<FuncionalidadeSelfReflectionView> createState() =>
      _FuncionalidadeSelfReflectionViewState();
}

class _FuncionalidadeSelfReflectionViewState
    extends State<FuncionalidadeSelfReflectionView> {
  // Lista de perguntas de exemplo (prompts que serão feito por IA posteriormente)
  final List<String> _prompts = [
    "O que te trouxe alegria hoje, por menor que seja?",
    "Qual foi o maior desafio que você enfrentou hoje e como lidou com ele?",
    "Pelo que você se sente grato(a) neste momento?",
    "Se você pudesse dar um conselho para si mesmo(a) no início do dia, qual seria?",
    "Qual pequena ação você pode tomar amanhã para se aproximar de um objetivo seu?",
  ];

  // Controllers para cada campo de texto
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_prompts.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas de Reflexão'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        itemCount: _prompts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _prompts[index],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _controllers[index],
                    decoration: const InputDecoration(
                      hintText: 'Sua resposta aqui...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}