import 'package:flutter/material.dart';
import 'package:projeto_flutter_1/questao.dart';
import 'package:projeto_flutter_1/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) respondeuPergunta;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.respondeuPergunta,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => respondeuPergunta(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
