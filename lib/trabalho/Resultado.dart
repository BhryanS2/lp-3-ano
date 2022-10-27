import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String nome;
  final List notas;
  final int radioValue;
  final int radioValue2;
  final bool switchValue;
  final bool checkboxValue;

  const Resultado({
    Key? key,
    required this.nome,
    required this.notas,
    required this.radioValue,
    required this.radioValue2,
    required this.switchValue,
    required this.checkboxValue,
  }) : super(key: key);

  String cursoEscolhido() {
    return radioValue == 0 ? 'Ciência da Computação' : 'Sistemas de Informação';
  }

  String cursoNaoEscolhido() {
    return radioValue2 == 1
        ? 'Sistemas de Informação'
        : 'Ciência da Computação';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // - 1 campo de texto;
              Text('Nome: $nome'),
              // - 4 sliders (notas);
              Text('Nota do 1º bimestre: ${notas[0]}'),
              Text('Nota do 2º bimestre: ${notas[1]}'),
              Text('Nota do 3º bimestre: ${notas[2]}'),
              Text('Nota do 4º bimestre: ${notas[3]}'),

              // - 2 radio buttons;
              Text("Você cursa o curso de ${cursoEscolhido()}"),
              Text("Não cursa o curso de ${cursoNaoEscolhido()}"),
              // - 1 switch;
              Text(
                  "Você está no periodo noturno? ${switchValue ? 'Sim' : 'Não'}"),
              // - 1 checkbox;
              Text('Você é bolsista? ${checkboxValue ? 'Sim' : 'Não'}'),
            ],
          ),
        ),
      ),
    );
  }
}
