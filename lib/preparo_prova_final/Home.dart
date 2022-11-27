import 'package:flutter/material.dart';
import 'helper/exemplo_helper.dart';
import 'model/exemplo_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Exemplo> _exemplos = <Exemplo>[];
  // helper
  final ExemploHelper _exemploHelper = ExemploHelper();

  // int? id;
  // late String texto;
  // late int numero;
  // late DateTime data;
  // late double slider;
  // late bool switchValue;
  // late bool checkboxValue;
  // late int radioValue;
  // late String selectValue;
  // late String imagem;

  final TextEditingController _textoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  int _radioValue = 0;
  String _selectValue = 'Selecione';
  String _imagem = '';
  double _slider = 0.0;
  bool _switchValue = false;
  bool _checkboxValue = false;

  _exibirTelaCadastro({Exemplo? exemplo}) {
    String textoAcaoUsuario = "";
    if (exemplo == null) {
      //inserindo
      _textoController.text = "";
      _numeroController.text = "";
      _dataController.text = "";

      _radioValue = 0;
      _selectValue = 'Selecione';
      _imagem = '';
      _slider = 0.0;
      _switchValue = false;
      _checkboxValue = false;

      textoAcaoUsuario = "Salvar";
    } else {
      //atualizando
      _textoController.text = exemplo.texto;
      _numeroController.text = exemplo.numero.toString();
      _dataController.text = exemplo.data.toString();

      _radioValue = exemplo.radioValue;
      _selectValue = exemplo.selectValue;
      _imagem = exemplo.imagem;
      _slider = exemplo.slider;
      _switchValue = exemplo.switchValue;
      _checkboxValue = exemplo.checkboxValue;

      textoAcaoUsuario = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text("$textoAcaoUsuario exemplo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _textoController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: "Texto",
                    hintText: "Digite o texto",
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: _numeroController,
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: "Número",
                    hintText: "Digite o número",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _dataController,
                  autofocus: false,
                  decoration: const InputDecoration(
                    labelText: "Data",
                    hintText: "Digite a data",
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                Slider(
                  value: _slider,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: _slider.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Switch'),
                  value: _switchValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _switchValue = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Checlbox'),
                  value: _checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValue = value!;
                    });
                  },
                ),
                const Text("Escolha um radio"),
                RadioListTile(
                  title: const Text('Radio 1'),
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Radio 2'),
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                ),
                const Text("Escolha um select"),
                DropdownButton<String>(
                  value: _selectValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Selecione',
                    'Opção 1',
                    'Opção 2',
                    'Opção 3',
                    'Opção 4',
                    'Opção 5',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const Text("Escolha uma imagem"),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _imagem = 'assets/cliente1.png';
                        });
                      },
                      child: const Text('Imagem 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _imagem = 'assets/cliente2.png';
                        });
                      },
                      child: const Text('Imagem 2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _imagem = 'assets/logo.png';
                        });
                      },
                      child: const Text('Imagem 3'),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text(textoAcaoUsuario),
                onPressed: () {
                  //salvar
                  _salvarAtualizarExemplo(exemploSelecionado: exemplo);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _recuperarExemplo() async {
    List exemplosRecuperados = await _exemploHelper.recuperarAnotacoes();
    List<Exemplo> listaTemporaria = <Exemplo>[];
    for (var item in exemplosRecuperados) {
      Exemplo exemplo = Exemplo(
          checkboxValue: _checkboxValue,
          data: _dataController.text,
          imagem: _imagem,
          numero: int.parse(_numeroController.text),
          radioValue: _radioValue,
          selectValue: _selectValue,
          slider: _slider,
          switchValue: _switchValue,
          texto: _textoController.text,
          id: item["id"]);
      listaTemporaria.add(exemplo);
    }
    setState(() {
      _exemplos = listaTemporaria;
    });
  }

  void _showDialogMessage(String message) async {
    await Future.delayed(const Duration(seconds: 0));

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  _salvarAtualizarExemplo({Exemplo? exemploSelecionado}) async {
    if (exemploSelecionado == null) {
      Exemplo exemplo = Exemplo(
        checkboxValue: _checkboxValue,
        data: _dataController.text,
        imagem: _imagem,
        numero: int.parse(_numeroController.text),
        radioValue: _radioValue,
        selectValue: _selectValue,
        slider: _slider,
        switchValue: _switchValue,
        texto: _textoController.text,
        id: null,
      );
      int resultado = await _exemploHelper.salvarExemplo(exemplo);
      if (resultado == 0) {
        _showDialogMessage("Erro ao salvar exemplo");
      } else {
        _showDialogMessage("Exemplo salvo com sucesso");
      }

      // limpar campos
      _textoController.text = "";
      _numeroController.text = "";
      _dataController.text = "";
      _imagem = "";
      _slider = 0;
      _switchValue = false;
      _checkboxValue = false;
      _radioValue = 0;
      _selectValue = "Selecione";

      _recuperarExemplo();
      return;
    }
    exemploSelecionado.checkboxValue = _checkboxValue;
    exemploSelecionado.data = _dataController.text;
    exemploSelecionado.imagem = _imagem;
    exemploSelecionado.numero = int.parse(_numeroController.text);
    exemploSelecionado.radioValue = _radioValue;
    exemploSelecionado.selectValue = _selectValue;
    exemploSelecionado.slider = _slider;
    exemploSelecionado.switchValue = _switchValue;
    exemploSelecionado.texto = _textoController.text;

    int resultado = await _exemploHelper.atualizarExemplo(exemploSelecionado);
    if (resultado == 0) {
      _showDialogMessage("Erro ao atualizar exemplo");
    } else {
      _showDialogMessage("Exemplo atualizado com sucesso");
    }

    _recuperarExemplo();
  }

  _removerExemplo(int? id) async {
    if (id == null) {
      _showDialogMessage("Erro ao remover exemplo");
      return;
    }
    await _exemploHelper.removerExemplo(id);
    _showDialogMessage("Exemplo removido com sucesso");
    _recuperarExemplo();
  }

  @override
  void initState() {
    super.initState();
    _recuperarExemplo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Exemploes"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _exemplos.length,
                  itemBuilder: (context, index) {
                    final exemplo = _exemplos[index];
                    return Card(
                      child: ListTile(
                        title: Text(exemplo.texto),
                        subtitle: Image.asset(exemplo.imagem),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(exemplo: exemplo);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerExemplo(exemplo.id);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
