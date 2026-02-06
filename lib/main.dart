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
    final startTime = DateTime.now();
    print('🔥 [IA] Iniciando chamada para gerar frase - ${startTime.toIso8601String()}');

    try {
      // Simulação de chamada à IA (substitua aqui pela chamada real depois)
      await Future.delayed(const Duration(seconds: 2));

      const fraseSimulada = "A persistência transforma pequenos passos em grandes conquistas.";

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('✅ [IA] Resposta recebida com sucesso');
      print('   Tempo gasto: ${duration.inMilliseconds} ms (${duration.inSeconds}.${duration.inMilliseconds % 1000}s)');
      print('   Frase gerada: "$fraseSimulada"');

      return fraseSimulada;
    } catch (e, stackTrace) {
      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('❌ [IA] Erro ao gerar frase');
      print('   Tempo até o erro: ${duration.inMilliseconds} ms');
      print('   Erro: $e');
      print('   StackTrace: $stackTrace');

      rethrow; // relança para o catch externo tratar
    }
  }

  Future<void> _gerarFrase() async {
    print('👆 Botão "Nova Frase" pressionado');

    setState(() {
      _carregando = true;
      _fraseGerada = "Pensando em algo inspirador...";
    });

    print('⏳ Iniciando processo de geração de frase');

    try {
      final frase = await gerarFraseIA();

      print('🎉 Frase atualizada na tela com sucesso');

      setState(() {
        _fraseGerada = frase;
      });
    } catch (e) {
      print('⚠️ Falha ao atualizar frase na interface');

      setState(() {
        _fraseGerada = "Erro ao gerar frase. Tente novamente.\n($e)";
      });
    } finally {
      setState(() {
        _carregando = false;
      });
      print('🏁 Processo de geração finalizado\n');
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: _carregando
                          ? const CircularProgressIndicator(color: Colors.white)
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