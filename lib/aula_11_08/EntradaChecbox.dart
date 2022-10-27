import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool? _comidaBrasileira = false;
  bool? _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
                title: Text("Comida Brasileira"),
                subtitle:
                    Text("A melhor comida do mundo!!"), //Subtitulo//subtexto
                //activeColor: Colors.red, //cor da caixa de seleção marcado/desmarcado
                //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                value: _comidaBrasileira,
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaBrasileira = valor;
                  });
                }),
            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("A melhor comida do mundo!!"),
                //activeColor: Colors.red,
                //selected: true,
                //secondary: Icon(Icons.add_box),
                value: _comidaMexicana, //valor inicial marcado/desmarcado
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaMexicana = valor;
                  });
                }),
            RaisedButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print("Comida Brasileira: " +
                          _comidaBrasileira.toString() +
                          " Comida Mexicana " +
                          _comidaMexicana
                              .toString() //convertendo bool em string
                      );
                })

            /*
            Text("Comida Brasileira"),
            Checkbox(
              value: _estaSelecionado,
              onChanged: (bool valor){
                setState(() {
                  _estaSelecionado = valor;
                });
                print("Checkbox: " + valor.toString() ); //convertendo bool em string
              },
            )*/
          ],
        ),
      ),
    );
  }
}
