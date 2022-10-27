// Ana Luiza de Paula Ferreira
// Jamilly dos Santos Nascimento

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProvaLp(),
  ));
}

class ProvaLp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ProvaLp> {
  int? _escolha;

  double valor1 = 0;
  String label1 = "0";

  double valor2 = 0;
  String label2 = "0";

  double valor3 = 0;
  String label3 = "0";

  double maior = 0;
  double medio = 0;
  double menor = 0;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  TextEditingController _controllerCurso = TextEditingController();

  void _calcular() {
    // descobrir maior, medio e menor
    // List lista = [valor1, valor2, valor3];
    // lista.sort();
    // menor = lista[0];
    // medio = lista[1];
    // maior = lista[2];
    if (valor1 > valor2 && valor2 > valor3) {
      maior = valor1;
      medio = valor2;
      menor = valor3;
    }
    if (valor1 > valor3 && valor3 > valor1) {
      maior = valor1;
      medio = valor3;
      menor = valor2;
    } else if (valor2 > valor1 && valor1 > valor3) {
      maior = valor2;
      medio = valor1;
      menor = valor3;
    } else if (valor2 > valor3 && valor3 > valor1) {
      maior = valor2;
      medio = valor3;
      menor = valor1;
    } else if (valor3 > valor1 && valor1 > valor2) {
      maior = valor3;
      medio = valor1;
      menor = valor2;
    } else if (valor3 > valor2 && valor2 > valor1) {
      maior = valor3;
      medio = valor2;
      menor = valor1;
    }
  }

  void _mostrar() {
    _calcular();
    String nome = _controllerNome.text;
    String sobrenome = _controllerSobrenome.text;
    String idade = _controllerIdade.text;
    String curso = _controllerCurso.text;
    double resultado = 0;

    if (_escolha == 1) {
      resultado = maior;
    } else if (_escolha == 2) {
      resultado = medio;
    }
    if (_escolha == 3) {
      resultado = menor;
    }
    print(resultado);
    print(nome);
    print(sobrenome);
    print(idade);
    print(curso);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Luiza e Jamilly Nascimento"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
              child: TextField(
                  //text, number, emailAddress, datetime
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  //enabled: false,
                  //maxLength: 2,
                  //maxLengthEnforced: false,
                  controller: _controllerNome,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
              child: TextField(
                  //text, number, emailAddress, datetime
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  //enabled: false,
                  //maxLength: 2,
                  //maxLengthEnforced: false,
                  controller: _controllerSobrenome,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
              child: TextField(
                  //text, number, emailAddress, datetime
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Nome"),
                  //enabled: false,
                  //maxLength: 2,
                  //maxLengthEnforced: false,
                  controller: _controllerIdade,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
              child: TextField(
                  //text, number, emailAddress, datetime
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  //enabled: false,
                  //maxLength: 2,
                  //maxLengthEnforced: false,
                  controller: _controllerCurso,
                  style: TextStyle(fontSize: 20, color: Colors.red)),
            ),
            RadioListTile(
                title: Text("Maior"), //titulo da lista
                value: 1, //tipo do valor do campo
                groupValue: _escolha, // tipo do grupo
                onChanged: (int? escolha) {
                  setState(() {
                    _escolha = escolha;
                  });
                }),
            RadioListTile(
                title: Text("Madio"), //titulo da lista
                value: 2, //tipo do valor do campo
                groupValue: _escolha, // tipo do grupo
                onChanged: (int? escolha) {
                  setState(() {
                    _escolha = escolha;
                  });
                }),
            RadioListTile(
                title: Text("Menor"), //titulo da lista
                value: 3, //tipo do valor do campo
                groupValue: _escolha, // tipo do grupo
                onChanged: (int? escolha) {
                  setState(() {
                    _escolha = escolha;
                  });
                }),
            Slider(
                value: valor1, //valor inicial do campo
                min: 0, // valor minimo
                max: 5, // valor maximo
                label:
                    label1, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                divisions:
                    5, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                activeColor: Colors.red, // cor do slider
                inactiveColor: Colors
                    .deepOrangeAccent, //cor da linha do slides//o que não esta selecionado
                onChanged: (double novoValor) {
                  setState(() {
                    valor1 = novoValor;
                    label1 = novoValor
                        .toString(); //altero o valor que acompanha o label de forma automática
                  });
                  //print("Valor selecionado: " + novoValor.toString() );
                }),
            Slider(
                value: valor2, //valor inicial do campo
                min: 0, // valor minimo
                max: 5, // valor maximo
                label:
                    label2, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                divisions:
                    5, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                activeColor: Colors.red, // cor do slider
                inactiveColor: Colors
                    .deepOrangeAccent, //cor da linha do slides//o que não esta selecionado
                onChanged: (double novoValor) {
                  setState(() {
                    valor2 = novoValor;
                    label2 = novoValor
                        .toString(); //altero o valor que acompanha o label de forma automática
                  });
                  //print("Valor selecionado: " + novoValor.toString() );
                }),
            Slider(
              value: valor3, //valor inicial do campo
              min: 0, // valor minimo
              max: 5, // valor maximo
              label:
                  label3, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
              divisions:
                  5, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
              activeColor: Colors.red, // cor do slider
              inactiveColor: Colors
                  .deepOrangeAccent, //cor da linha do slides//o que não esta selecionado
              onChanged: (double novoValor) {
                setState(() {
                  valor3 = novoValor;
                  label3 = novoValor
                      .toString(); //altero o valor que acompanha o label de forma automática
                });
                //print("Valor selecionado: " + novoValor.toString() );
              },
            ),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 20 //tamanho do texto do botão
                    ),
              ),
              onPressed: () => {
                _mostrar(),
              },
            )
          ],
        ),
      ),
    );
  }
}
