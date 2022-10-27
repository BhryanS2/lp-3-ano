import 'package:flutter/material.dart';

class AnaForm extends StatefulWidget {
  @override
  _HomeAnaState createState() => _HomeAnaState();
}

class _HomeAnaState extends State<AnaForm> {
  bool? _sabor1 = false;
  bool? _sabor2 = false;
  bool? _sabor3 = false;
  int? _escolhaBorda;
  double quantidade = 1;
  String label = "1";
  bool _entregar = false;
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEndereco = TextEditingController();

  String _saborescolhido = "";
  Widget _buildEntrega() {
    if (_entregar) {
      return Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            //text, number, emailAddress, datetime
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Endereço"),
            //enabled: false,
            //maxLength: 2,
            //maxLengthEnforced: false,
            controller: _controllerEndereco,
            style: TextStyle(fontSize: 20, color: Colors.red),
            //obscureText: true,
          ),
        ),
      ]);
    }
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }

  void _escolhersabor() {
    if (_sabor1 == true) {
      _saborescolhido += " Mussarela ";
    }
    if (_sabor2 == true) {
      _saborescolhido += " Portuguesa ";
    }
    if (_sabor3 == true) {
      _saborescolhido += " Calabresa ";
    }
  }

  void _fazerpedido() {
    _escolhersabor();
    String nome = _controllerNome.text;
    String endereco = _controllerEndereco.text;
    String borda = "";
    switch (_escolhaBorda) {
      case 1:
        borda = "Catupiry";
        break;
      case 2:
        borda = "Cheddar";
        break;
      default:
        borda = "Sem borda";
        break;
    }
    String entrega = "";
    if (_entregar) {
      entrega = "Entregar em: $endereco";
    } else {
      entrega = "Retirar no local";
    }
    _buildResultado(nome: nome, borda: borda, entrega: entrega);
  }

  Widget _buildResultado({String? nome, String? borda, String? entrega}) {
    if (nome == "" || borda == "" || entrega == "") {
      return Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
        ],
      );
    }
    return AlertDialog(
      title: Text("Pedido"),
      content: Text(
          "Nome: $nome \nSabores: $_saborescolhido \nBorda: $borda \n$entrega"),
      actions: <Widget>[
        TextButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyForm"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 35, bottom: 20),
              child: Text(
                "Meu Pedido",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Container(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
                  child: Text(
                    "Opções",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      //color: Colors.red
                    ),
                  ),
                ),
                CheckboxListTile(
                    title: Text("Mussarela"),
                    subtitle: Text("Ingredientes"), //Subtitulo//subtexto
                    activeColor:
                        Colors.red, //cor da caixa de seleção marcado/desmarcado
                    //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                    //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                    value: _sabor1,
                    onChanged: (bool? valor) {
                      setState(() {
                        _sabor1 = valor;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Portuguesa"),
                    subtitle: Text("Ingredientes"), //Subtitulo//subtexto
                    activeColor:
                        Colors.red, //cor da caixa de seleção marcado/desmarcado
                    //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                    //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                    value: _sabor2,
                    onChanged: (bool? valor) {
                      setState(() {
                        _sabor2 = valor;
                      });
                    }),
                CheckboxListTile(
                    title: Text("Calabresa"),
                    subtitle: Text("Ingredientes"), //Subtitulo//subtexto
                    activeColor:
                        Colors.red, //cor da caixa de seleção marcado/desmarcado
                    //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                    //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                    value: _sabor3,
                    onChanged: (bool? valor) {
                      setState(() {
                        _sabor3 = valor;
                      });
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
                  child: Text(
                    "Bordas",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      //color: Colors.red
                    ),
                  ),
                ),
                RadioListTile(
                    title: Text("Catupiri"), //titulo da lista
                    value: 1, //tipo do valor do campo
                    groupValue: _escolhaBorda, // tipo do grupo
                    onChanged: (int? escolha) {
                      setState(() {
                        _escolhaBorda = escolha;
                      });
                    }),
                RadioListTile(
                    title: Text("Cheddar"), //titulo da lista
                    value: 2, //tipo do valor do campo
                    groupValue: _escolhaBorda, // tipo do grupo
                    onChanged: (int? escolha) {
                      setState(() {
                        _escolhaBorda = escolha;
                      });
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
                  child: Text(
                    "Quantidade",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      //scolor: Colors.red
                    ),
                  ),
                ),
                Slider(
                    value: quantidade, //valor inicial do campo
                    min: 1, // valor minimo
                    max: 10, // valor maximo
                    label:
                        label, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                    divisions:
                        9, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                    activeColor: Colors.red, // cor do slider
                    inactiveColor: Colors
                        .deepOrangeAccent, //cor da linha do slides//o que não esta selecionado
                    onChanged: (double novoValor) {
                      setState(() {
                        quantidade = novoValor;
                        label = novoValor
                            .toString(); //altero o valor que acompanha o label de forma automática
                      });
                      //print("Valor selecionado: " + novoValor.toString() );
                    }),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
              child: Text(
                "Cliente e Entrega",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 32,
                  //color: Colors.red
                ),
              ),
            ),
            Container(
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
                  SwitchListTile(
                      //se o cliente desejar a entrega deverá ser inserido o campo de endereço
                      title: Text("Entregar"),
                      value: _entregar,
                      onChanged: (bool valor) {
                        setState(() {
                          _entregar = !_entregar;
                        });
                      }),
                ],
              ),
            ),
            _buildEntrega(),
            RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize: 20 //tamanho do texto do botão
                      ),
                ),
                onPressed: _fazerpedido),
            _buildResultado(),
            Container(
              child: Column(
                children: <Widget>[],
              ),
            ),
          ]),
        ));
  }
}
