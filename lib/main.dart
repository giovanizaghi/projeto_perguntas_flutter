import 'package:flutter/material.dart';
import "./questionario.dart";
import "./resultado.dart";

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo Guará', 'pontuacao': 10},
        {'texto': 'Onça Pintada', 'pontuacao': 5},
        {'texto': 'Arara Azul', 'pontuacao': 3},
        {'texto': 'Tatu Bola', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu país preferido?',
      'respostas': [
        {'texto': 'Portugal', 'pontuacao': 10},
        {'texto': 'Estados Unidos', 'pontuacao': 5},
        {'texto': 'França', 'pontuacao': 3},
        {'texto': 'Canadá', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      //verificar para nao fazer mudança descenessária no state
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Questionario(
          perguntaSelecionada: _perguntaSelecionada,
          perguntas: _perguntas,
          responder: _responder,
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
