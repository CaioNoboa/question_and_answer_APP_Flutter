import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Se todo A é B e nenhum B é C, é possível concluir, corretamente, que:',
      'respostas': [
        {'texto': 'nenhum B é A', 'pontuacao': 0},
        {'texto': 'nenhum A é C', 'pontuacao': 1},
        {'texto': 'todo A é C', 'pontuacao': 0},
        {'texto': 'todo C é B', 'pontuacao': 0},
        {'texto': 'todo B é A', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'A proposição funcional "Para todo e qualquer valor de n, tem-se 6n < n² + 8" será verdadeira, se n for um número real',
      'respostas': [
        {'texto': 'menor que 8', 'pontuacao': 0},
        {'texto': 'menor que 4', 'pontuacao': 0},
        {'texto': 'menor que 2', 'pontuacao': 1},
        {'texto': 'maior que 2', 'pontuacao': 0},
        {'texto': 'maior que 3', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Uma quantia em dinheiro foi dividida entre 4 pessoas. Sabe-se que cada pessoa gastou a metade do dinheiro que recebeu, e 1/4 do restante do dinheiro de cada pessoa foi colocado em uma caixa, totalizando R\$ 20,00. Assinale a quantia dividida inicialmente:',
      'respostas': [
        {'texto': 'R\$ 80,00', 'pontuacao': 0},
        {'texto': 'R\$ 160,00', 'pontuacao': 1},
        {'texto': 'R\$ 180,00', 'pontuacao': 0},
        {'texto': 'R\$ 120,00', 'pontuacao': 0},
        {'texto': 'R\$ 200,00', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Considere que os termos da sequência seguinte foram sucessivamente obtidos segundo determinado padrão: (3,  7,  15,  31,  63,  127,  255,  ...). O décimo termo dessa sequência é:',
      'respostas': [
        {'texto': '1537', 'pontuacao': 0},
        {'texto': '1929', 'pontuacao': 0},
        {'texto': '1945', 'pontuacao': 0},
        {'texto': '2047', 'pontuacao': 1},
        {'texto': '2319', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Numa rua, todas as casas, cujas famílias têm mais de três pessoas, são próprias. Sabe-se que João mora nessa rua, em uma casa própria. Diante do exposto, marque a alternativa correta:',
      'respostas': [
        {'texto': 'segunda-feira', 'pontuacao': 0},
        {'texto': 'terça-feira', 'pontuacao': 0},
        {'texto': 'quarta-feira', 'pontuacao': 0},
        {'texto': 'quinta-feira', 'pontuacao': 0},
        {'texto': 'sexta-feira', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Em uma caixa, há 2 bolas azuis, 3 bolas amarelas e 4 bolas pretas. Serão retiradas N bolas dessa caixa, simultaneamente e de forma totalmente aleatória. O menor valor inteiro positivo de N, para que se possa garantir que haverá bolas de todas as cores, é:',
      'respostas': [
        {'texto': '4', 'pontuacao': 0},
        {'texto': '5', 'pontuacao': 0},
        {'texto': '6', 'pontuacao': 0},
        {'texto': '7', 'pontuacao': 0},
        {'texto': '8', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Carlos é filho de Mariana, que é filha de Adriana. Sabe-se ainda, que Pablo é avô de Mariana por parte de mãe. Portanto, NÃO é correto afirmar que:',
      'respostas': [
        {'texto': 'Carlos é neto de Adriana', 'pontuacao': 0},
        {'texto': 'Pablo é avô de Mariana', 'pontuacao': 0},
        {'texto': 'Mariana não é neta de Pablo', 'pontuacao': 1},
        {'texto': 'Adriana é avó de Carlos', 'pontuacao': 0},
        {'texto': 'Adriana tem pelo menos um neto', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Relativamente aos tempos de serviço de dois funcionários do Banco do Brasil, sabe-se que sua soma é 5 anos e 10 meses e que estão entre si na razão 3/2. Nessas condições,  a diferença positiva entre os tempos de serviço desses funcionários é de:',
      'respostas': [
        {'texto': '2 anos e 8 meses', 'pontuacao': 0},
        {'texto': '2 anos e 6 meses', 'pontuacao': 0},
        {'texto': '2 anos e 3 meses', 'pontuacao': 0},
        {'texto': '1 ano e 5 meses', 'pontuacao': 0},
        {'texto': '1 ano e 2 meses', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Juliana é irmã da prima do irmão de Guilherme. Sabe-se que Guilherme tem um único irmão e Juliana uma única irmã. Portanto, pode-se afirmar que:',
      'respostas': [
        {'texto': 'Juliana não é prima de Guilherme', 'pontuacao': 0},
        {'texto': 'Guilherme é irmão de Juliana', 'pontuacao': 0},
        {'texto': 'Guilherme tem apenas uma prima', 'pontuacao': 0},
        {'texto': 'Guilherme tem pelo menos duas primas', 'pontuacao': 1},
        {'texto': 'Juliana tem apenas um primo', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Aldo e Eduardo são três amigos. Dois deles têm 66 anos, e sempre mentem. O outro deles tem 48 anos e sempre diz a verdade. Se Aldo disse “- A idade de Daniel não é 66 anos”, então é correto afirmar que:',
      'respostas': [
        {'texto': 'Eduardo e Daniel dizem a verdade', 'pontuacao': 0},
        {'texto': 'Aldo e Eduardo mentem', 'pontuacao': 0},
        {'texto': 'Eduardo tem 48 anos', 'pontuacao': 1},
        {'texto': 'Aldo diz a verdade', 'pontuacao': 0},
        {'texto': 'Aldo tem 48 anos', 'pontuacao': 0},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                respondeuPergunta: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}