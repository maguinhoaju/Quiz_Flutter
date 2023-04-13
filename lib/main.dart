import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _respostaSelecionada = 0;

  void _responder() {
    setState(() {
      if (_respostaSelecionada == perguntas.length - 1) {
        _respostaSelecionada = 0;
      } else {
        _respostaSelecionada++;
      }
    });
    if (kDebugMode) {
      print('Resposta selecionada: $_respostaSelecionada');
    }
  }

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Azul', 'Branco', 'Amarelo'],
    },
    {
      'texto': 'Qual é o seu apelido?',
      'respostas': ['Magro', 'Maguinho', 'Toinho', 'Little Wizard'],
    },
    {
      'texto': 'Qual é a cor da sua casa?',
      'respostas': ['Branca', 'Rosa', 'Verde', 'Cinza'],
    },
    {
      'texto': 'Qual é o nome do seu pai?',
      'respostas': ['José', 'Romualdo', 'Roldão', 'Antônio'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Gato', 'Cavalo', 'Cachorro', 'Papagaio'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> respostas = [];

    for (String textoResp
        in perguntas[_respostaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas'), centerTitle: true),
        body: Column(
          children: [
            Questao(perguntas[_respostaSelecionada]['texto'].toString()),
            ...respostas // ... = operador que faz com que todos os elementos da lista sejam listados
          ],
        ),
      ),
    );
  }
}
