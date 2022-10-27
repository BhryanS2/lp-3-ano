import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  int? _escolhaUsuario;

  void setOnchage(int? valor) {
    setState(() {
      _escolhaUsuario = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile(
              title: const Text("Masculino"), //titulo da lista
              value: 1, //tipo do valor do campo
              groupValue: _escolhaUsuario, // tipo do grupo
              onChanged: (int? escolha) {
                setState(() {
                  _escolhaUsuario = escolha;
                });
              }),
          RadioListTile(
              title: const Text("Feminino"),
              value: 2,
              groupValue: _escolhaUsuario,
              onChanged: setOnchage),
          RadioListTile(
              title: const Text("Outro"),
              value: 3,
              groupValue: _escolhaUsuario,
              onChanged: setOnchage),
          MaterialButton(
              onPressed: () {
                print("valor escolhido: " + _escolhaUsuario.toString());
              },
              child: Text("Salvar", style: TextStyle(color: Colors.white)),
              color: Colors.blue)
          // RaisedButton(
          //     child: const Text(
          //       "Salvar",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     onPressed: () {
          //       print("Resultado: " +
          //           _escolhaUsuario.toString()); //convertendo numero em texto
          //     })

          /*
          Text("Masculino"),
          Radio(
              value: "m",
              groupValue: _escolhaUsuario,
              onChanged: (String escolha){
                setState(() {
                  _escolhaUsuario = escolha;
                });
                print("resultado: " + escolha);
              }
          ),
          Text("Feminino"),
          Radio(
              value: "f",
              groupValue: _escolhaUsuario,
              onChanged: (String escolha){
                setState(() {
                  _escolhaUsuario = escolha;
                });
                print("resultado: " + escolha);
              }
          ),
          */
//value é o valor do item
//group eu crio o grupo que o radio faz parte e apenas um item pode ser selecionado//precisa ser do tipo do group
// onChanged função anonima//recebe o que foi escolhido pelo usuario
        ],
      ),
    );
  }
}
