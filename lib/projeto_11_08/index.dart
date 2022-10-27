import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  int? _escolhaUsuario = 0;
  bool _switchValue = false;
  bool? _checkBoxValue = false;
  int? _radioValue = 0;
  int? _sliderValue = 0;
  String? _nome = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Seu nome"),
            style: const TextStyle(fontSize: 16, color: Colors.black),
            onChanged: (String value) {
              setState(() {
                _nome = value;
              });
            },
          ),

          // Escolha da imagem
          Column(
            children: <Widget>[
              // radios
              RadioListTile(
                title: const Text("Masculino"), //titulo da lista
                value: 1, //tipo do valor do campo
                groupValue: _radioValue, // tipo do grupo
                onChanged: (int? escolha) {
                  setState(() {
                    _radioValue = escolha;
                  });
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: _radioValue,
                onChanged: (int? escolha) {
                  setState(() {
                    _radioValue = escolha;
                  });
                },
                title: const Text("Feminino"),
              )
            ],
          ),
          // ACeita notificações - Switch
          SwitchListTile(
            title: const Text("Aceita notificações"),
            value: _switchValue,
            onChanged: (bool escolha) {
              setState(() {
                _switchValue = escolha;
              });
            },
          ),
          // CheckBox
          CheckboxListTile(
            title: const Text("Aceita notificações"),
            value: _checkBoxValue,
            onChanged: (bool? valor) {
              setState(() {
                _checkBoxValue = valor;
              });
            },
          ),
          // Slider
          Slider(
            value: _sliderValue?.toDouble() ?? 0,
            min: 0,
            max: 10,
            divisions: 10,
            label: "${_sliderValue?.toDouble() ?? 0}",
            onChanged: (double valor) {
              setState(() {
                _sliderValue = valor.round();
              });
            },
          ),
          // Botão de salvar
          MaterialButton(
            onPressed: () {
              print("valor escolhido: " + _escolhaUsuario.toString());
            },
            child: Text("Salvar", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
