import 'package:flutter/material.dart';
import "./questionario.dart";
import "./resultado.dart";

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo Guará', 'nota': 10},
        {'texto': 'Onça Pintada', 'nota': 5},
        {'texto': 'Arara Azul', 'nota': 3},
        {'texto': 'Tatu Bola', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu país preferido?',
      'respostas': [
        {'texto': 'Portugal', 'nota': 10},
        {'texto': 'Estados Unidos', 'nota': 5},
        {'texto': 'França', 'nota': 3},
        {'texto': 'Canadá', 'nota': 1},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      //verificar para nao fazer mudança descenessária no state
      setState(() {
        _perguntaSelecionada++;
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
