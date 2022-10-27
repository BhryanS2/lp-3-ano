// (INDIVIDUAL)

// Desenvolver um APP (Formulário) com as seguintes características:

// - Pelo menos 1 campo de texto;

// - 4 sliders (notas);

// - Pelo menos 1 checkbox;

// - Pelo menos 2 RadioButton;

// - Pelo menos 1 swtich;

// - Um botão.

// Quando o botão for acionado, todas informações devem ser enviadas para uma outra tela da seguinte forma: 4 variáveis com as notas dos sliders e um texto com o restante das informações do formulário.

// A tela secundária deverá receber as notas e o texto e imprimir tudo na tela do APP.

// Enviar apenas os dois arquivos .dart (Tela inicial e tela secundária)

import 'package:flutter/material.dart';

import 'Resultado.dart';

void main() {
  runApp(Setup());
}

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho - Bhryan Stepenhen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerNome = TextEditingController();
  // notas dos sliders
  List notas = [0, 0, 0, 0];
  // variaveis para os radio buttons
  int _radioValue = 0;
  int _radioValue2 = 0;
  // variavel para o switch
  bool _switchValue = false;
  // variavel para o checkbox
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabalho - Bhryan Stepenhen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // - 1 campo de texto;
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                ),
                controller: _controllerNome,
              ),

              // - 4 sliders (notas);
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text('Entre com as notas do 1º ao 4º bimestre'),
              ),
              Slider(
                value: notas[0],
                min: 0,
                max: 10,
                divisions: 10,
                label: notas[0].toString(),
                onChanged: (double value) {
                  setState(() {
                    notas[0] = value;
                  });
                },
              ),
              Slider(
                value: notas[1],
                min: 0,
                max: 10,
                divisions: 10,
                label: notas[1].toString(),
                onChanged: (double value) {
                  setState(() {
                    notas[1] = value;
                  });
                },
              ),
              Slider(
                value: notas[2],
                min: 0,
                max: 10,
                divisions: 10,
                label: notas[2].toString(),
                onChanged: (double value) {
                  setState(() {
                    notas[2] = value;
                  });
                },
              ),
              Slider(
                value: notas[3],
                min: 0,
                max: 10,
                divisions: 10,
                label: notas[3].toString(),
                onChanged: (double value) {
                  setState(() {
                    notas[3] = value;
                  });
                },
              ),

              // - Pelo menos 2 RadioButton;
              const Text("Escolha qual o seu curso"),
              RadioListTile(
                title: const Text('Ciência da Computação'),
                value: 0,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Sistemas de Informação'),
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),

              // - Pelo menos 1 swtich;
              SwitchListTile(
                title: const Text('Você é do periodo noturno?'),
                value: _switchValue,
                onChanged: (bool? value) {
                  setState(() {
                    _switchValue = value!;
                  });
                },
              ),

              // - Pelo menos 1 checkbox;
              CheckboxListTile(
                title: const Text('Você é bolsista?'),
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
              ),

              // - Um botão.
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Resultado(
                        nome: _controllerNome.text,
                        notas: notas,
                        radioValue: _radioValue,
                        radioValue2: _radioValue2,
                        switchValue: _switchValue,
                        checkboxValue: _checkboxValue,
                      ),
                    ),
                  );
                },
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Enviar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
