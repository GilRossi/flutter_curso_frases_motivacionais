import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _frases = [
    "Acredite em você, o primeiro passo já te coloca à frente.",
    "Pequenos progressos diários constroem grandes conquistas.",
    "Desistir não acelera o caminho, insistir sim.",
    "O esforço de hoje é o orgulho de amanhã.",
    "Nem todo dia é fácil, mas todo dia vale a pena tentar.",
    "Disciplina vence a motivação quando a vontade falha.",
    "Você é mais capaz do que imagina.",
    "O sucesso nasce da constância, não da pressa.",
    "Faça o seu melhor agora, o futuro agradece."
  ];

  String _fraseGerada = "Clique abaixo para gerar uma nova frase!";

  void _gerarFrase() {
    final random = Random();
    setState(() {
      _fraseGerada = _frases[random.nextInt(_frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases Motivacionais"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: orientation == Orientation.portrait ? 4 : 2,
                  child: Image.asset(
                    "images/c10.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      _fraseGerada,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: _gerarFrase,
                    child: const Text(
                      "Nova Frase",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
