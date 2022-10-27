import 'package:flutter/material.dart';
import 'package:app/telasecundaria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Atividade(),
    );
  }
}

class Atividade extends StatefulWidget {
  const Atividade({Key? key}) : super(key: key);

  @override
  State<Atividade> createState() => _HomeState();
}

class _HomeState extends State<Atividade> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _sobrenome = TextEditingController();
  TextEditingController _matricula = TextEditingController();

  bool? _curso1 = false;
  bool? _curso2 = false;
  bool? _curso3 = false;
  int? _verificarTurno;
  double entrada = 1;
  String labelEntrada = "1";
  double saida = 1;
  String labelSaida = "1";
  bool _residente = false;

  String _nomeResultado = "";
  String _sobrenomeResultado = "";
  String _matriculaResultado = "";
  String _cursoResultado = "";
  String _periodoResultado = "";
  double _cHorariaResultado = 0;
  String _residenteResultado = "";

  void enviar() {
    if (_nome == "") {
      setState(() {
        //atualiza tela em tempo real
        _nomeResultado = "Texto não inserido";
      });
    } else {
      setState(() {
        //atualiza tela em tempo real
        _nomeResultado = _nome.text;
      });
    }

    if (_sobrenome == "") {
      setState(() {
        //atualiza tela em tempo real
        _sobrenomeResultado = "Texto não inserido";
      });
    } else {
      setState(() {
        //atualiza tela em tempo real
        _sobrenomeResultado = _sobrenome.text;
      });
    }

    if (_matricula == "") {
      setState(() {
        //atualiza tela em tempo real
        _matriculaResultado = "Texto não inserido";
      });
    } else {
      setState(() {
        //atualiza tela em tempo real
        _matriculaResultado = _matricula.text;
      });
    }
    if (_curso1 == true) {
      setState(() {
        //atualiza tela em tempo real
        _cursoResultado = "Alimentos";
      });
    }
    if (_curso2 == true) {
      setState(() {
        //atualiza tela em tempo real
        _cursoResultado = "Informática";
      });
    }
    if (_curso3 == true) {
      setState(() {
        //atualiza tela em tempo real
        _cursoResultado = "Agropecuaria";
      });
    }
    if (_verificarTurno == 1) {
      setState(() {
        _periodoResultado = "Manhã";
      });
    }
    if (_verificarTurno == 2) {
      setState(() {
        _periodoResultado = "Tarde";
      });
    }
    if (_verificarTurno == 3) {
      setState(() {
        _periodoResultado = "Noite";
      });
    }
    _cHorariaResultado = saida - entrada;

    if (_residente == true) {
      setState(() {
        _residenteResultado = "Sim";
      });
    } else {
      setState(() {
        _residenteResultado = "Não";
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaSecundaria(
            valor: "Nome: ${_nomeResultado}\n" +
                "Sobrenome: ${_sobrenomeResultado}\n" +
                "matricula: ${_matriculaResultado}\n" +
                "Curso: ${_cursoResultado}\n" +
                "Periodo: ${_periodoResultado}\n" +
                "Carga horária: ${_cHorariaResultado}\n" +
                "É residente ${_residenteResultado}\n"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividade Cadastro"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  //text, number, emailAddress, datetime//tipo de teclado
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  style: TextStyle(
                      //mesma coisa de texto
                      fontSize: 18,
                      color: Colors.blue),
                  //obscureText: true,//esconde um texto //senha

                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _nome,
//TextEditingController _textEditingController = TextEditingController();
                ),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  //text, number, emailAddress, datetime//tipo de teclado
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Sobrenome"),
                  style: TextStyle(
                      //mesma coisa de texto
                      fontSize: 18,
                      color: Colors.blue),
                  //obscureText: true,//esconde um texto //senha

                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _sobrenome,
//TextEditingController _textEditingController = TextEditingController();
                ),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  //text, number, emailAddress, datetime//tipo de teclado
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Matrícula"),
                  style: TextStyle(
                      //mesma coisa de texto
                      fontSize: 18,
                      color: Colors.blue),
                  //obscureText: true,//esconde um texto //senha

                  onSubmitted: (String texto) {
                    print("valor digitado:" + texto);
                  },
                  controller: _matricula,
//TextEditingController _textEditingController = TextEditingController();
                ),
              ),
              CheckboxListTile(
                  title: Text("Alimentos"),
                  activeColor:
                      Colors.blue, //cor da caixa de seleção marcado/desmarcado
                  //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                  //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                  value: _curso1,
                  onChanged: (bool? valor) {
                    setState(() {
                      _curso1 = valor;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Informática"),
                  activeColor:
                      Colors.blue, //cor da caixa de seleção marcado/desmarcado
                  //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                  //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                  value: _curso2,
                  onChanged: (bool? valor) {
                    setState(() {
                      _curso2 = valor;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Agropecuaria"),
                  activeColor:
                      Colors.blue, //cor da caixa de seleção marcado/desmarcado
                  //selected: true, //marcar texto da caixa de seleção como marcado/desmarcado
                  //secondary: Icon(Icons..add_box),//definir ícone que aparecerá antes do texto
                  value: _curso3,
                  onChanged: (bool? valor) {
                    setState(() {
                      _curso3 = valor;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
                child: Text(
                  "Turno",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    //color: Colors.blue
                  ),
                ),
              ),
              RadioListTile(
                  title: Text("Manhã"), //titulo da lista
                  value: 1, //tipo do valor do campo
                  groupValue: _verificarTurno, // tipo do grupo
                  onChanged: (int? escolha) {
                    setState(() {
                      _verificarTurno = escolha;
                    });
                  }),
              RadioListTile(
                  title: Text("Tarde"), //titulo da lista
                  value: 2, //tipo do valor do campo
                  groupValue: _verificarTurno, // tipo do grupo
                  onChanged: (int? escolha) {
                    setState(() {
                      _verificarTurno = escolha;
                    });
                  }),
              RadioListTile(
                  title: Text("Noite"), //titulo da lista
                  value: 3, //tipo do valor do campo
                  groupValue: _verificarTurno, // tipo do grupo
                  onChanged: (int? escolha) {
                    setState(() {
                      _verificarTurno = escolha;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 30),
                child: Text(
                  "Carga Horária",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    //scolor: Colors.blue
                  ),
                ),
              ),
              Slider(
                  value: entrada, //valor inicial do campo
                  min: 1, // valor minimo
                  max: 10, // valor maximo
                  label:
                      labelEntrada, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                  divisions:
                      9, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                  activeColor: Colors.blue, // cor do slider
                  inactiveColor: Colors
                      .blue, //cor da linha do slides//o que não esta selecionado
                  onChanged: (double novoValor) {
                    setState(() {
                      entrada = novoValor;
                      labelEntrada = novoValor
                          .toString(); //altero o valor que acompanha o label de forma automática
                    });
                    //print("Valor selecionado: " + novoValor.toString() );
                  }),
              Slider(
                  value: saida, //valor inicial do campo
                  min: 1, // valor minimo
                  max: 10, // valor maximo
                  label:
                      labelSaida, // texto que acompanha a seleção//só funciona junto com as divisões abaixo
                  divisions:
                      9, // quantidade de opções disponíveis para o usuario selecionar//senao ele pega todos valores no intervalo
                  activeColor: Colors.blue, // cor do slider
                  inactiveColor: Colors
                      .blue, //cor da linha do slides//o que não esta selecionado
                  onChanged: (double novoValor) {
                    setState(() {
                      saida = novoValor;
                      labelSaida = novoValor
                          .toString(); //altero o valor que acompanha o label de forma automática
                    });
                    //print("Valor selecionado: " + novoValor.toString() );
                  }),
              SwitchListTile(
                value: _residente,
                onChanged: (bool valor) {
                  setState(() {
                    _residente = valor;
                  });
                },
                title: Text("Residente"),
              ),
              RaisedButton(
                //
                child: Text("Enviar"),
                color: Colors.blue,
                onPressed: enviar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
