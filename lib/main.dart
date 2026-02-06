import 'package:flutter/material.dart';
import 'fraseIA.dart';

import 'frases_fallback.dart';


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
  String _fraseGerada = "Clique abaixo para gerar uma nova frase!";
  bool _carregando = false;

  /// Método único responsável por gerar a frase
  Future<void> _gerarFrase() async {
    if (_carregando) return;

    debugPrint('👆 Botão "Nova Frase" pressionado');

    setState(() {
      _carregando = true;
    });

    try {
      final frase = await OpenAIService.gerarFrase();

      debugPrint('✅ Frase recebida com sucesso');

      setState(() {
        _fraseGerada = frase;
      });
    } catch (e) {
      debugPrint('❌ Erro ao gerar frase: $e');

      setState(() {
        _fraseGerada = FrasesFallback.fraseAleatoria();
      });
    }
    finally {
      setState(() {
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases Motivacionais"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// Imagem
                  Expanded(
                    flex: orientation == Orientation.portrait ? 4 : 2,
                    child: Image.asset(
                      "images/c10.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  /// Frase com animação
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Text(
                          _fraseGerada,
                          key: ValueKey(_fraseGerada),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Botão
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _carregando ? null : _gerarFrase,
                      child: _carregando
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Nova Frase",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
