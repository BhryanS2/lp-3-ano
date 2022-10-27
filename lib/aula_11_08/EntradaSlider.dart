import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double valor = 0;
  String label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Container(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            Slider(
                value: valor, //valor inicial do campo
                min: 0, // valor minimo
                max: 10, // valor maximo
                label:
                    label, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                divisions:
                    10, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                activeColor: Colors.red, // cor do slider
                inactiveColor: Colors
                    .blue, //cor da linha do slides//o que não esta selecionado
                onChanged: (double novoValor) {
                  setState(() {
                    valor = novoValor;
                    label = novoValor
                        .toString(); //altero o valor que acompanha o label de forma automática
                  });
                  //print("Valor selecionado: " + novoValor.toString() );
                }),
            MaterialButton(
              onPressed: () {
                print("Valor selecionado: " + valor.toString());
              },
              color: Colors.grey[300],
              child: const Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
