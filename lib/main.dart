import 'package:flutter/material.dart';

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

  Future<String> gerarFraseIA() async {
    await Future.delayed(const Duration(seconds: 2)); // simulação
    return "A persistência transforma pequenos passos em grandes conquistas.";
  }

  Future<void> _gerarFrase() async {
    setState(() {
      _carregando = true;
      _fraseGerada = "Pensando em algo inspirador...";
    });

    try {
      final frase = await gerarFraseIA();
      setState(() {
        _fraseGerada = frase;
      });
    } catch (e) {
      setState(() {
        _fraseGerada = "Erro ao gerar frase. Tente novamente.";
      });
    } finally {
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
    );
  }
}
