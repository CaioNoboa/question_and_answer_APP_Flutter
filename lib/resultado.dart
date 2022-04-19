import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
  );

  String get fraseResultado {
    if(pontuacao == 10) {
      return 'Parabéns, você acertou todas as questões!';
    }
    else {
      return 'Você acertou $pontuacao de 10 perguntas!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // para centralizar
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(          
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 20),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],      
    );
  }
}