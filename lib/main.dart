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

  Future<void> _gerarFrase() async {
    if (_carregando) return;

    setState(() => _carregando = true);

    try {
      final frase = await OpenAIService.gerarFrase();
      setState(() => _fraseGerada = frase);
    } catch (_) {
      setState(() {
        _fraseGerada = FrasesFallback.fraseAleatoria();
      });
    } finally {
      setState(() => _carregando = false);
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
            final isLandscape = orientation == Orientation.landscape;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Flex(
                direction: isLandscape ? Axis.horizontal : Axis.vertical,
                children: [
                  /// IMAGEM (não rola)
                  Expanded(
                    flex: isLandscape ? 4 : 3,
                    child: Image.asset(
                      "images/c10.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(
                    width: isLandscape ? 20 : 0,
                    height: isLandscape ? 0 : 20,
                  ),

                  /// TEXTO + BOTÃO (rola se precisar)
                  Expanded(
                    flex: isLandscape ? 6 : 4,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedSwitcher(
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

                          const SizedBox(height: 32),

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
