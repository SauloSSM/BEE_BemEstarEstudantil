import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'O aplicativo foi criado com o objetivo de ajudar estudantes a cuidar do estresse, acompanhar emoções e melhorar sua saúde mental e equilíbrio durante a vida universitária.\n\nDesenvolvido por: Yuri de Assunção Facirolli.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}