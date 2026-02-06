import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
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

  var _fraseGerada = "Clique abaixo para gerar uma nova frase!";
  
  void _gerarFrase(){
    var numSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Frases Motivacionais",
          style: TextStyle(
          ),
        ),
        backgroundColor: Colors.lightBlueAccent[100],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                "images/c10.png",
              fit: BoxFit.fitWidth,
            ),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 23,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              child: Text(
                  "Nova Frase",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _gerarFrase
                ),
          ],
        ),
      ),
    );
  }
}
