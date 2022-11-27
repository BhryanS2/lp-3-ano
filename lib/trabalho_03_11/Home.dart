import 'package:flutter/material.dart';
import 'helper/FornecedorHelper.dart';
import 'model/FornecedorModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  FornecedorHelper _fornecedorHelper = FornecedorHelper();
  List<Fornecedor> _fornecedores = <Fornecedor>[];

  _exibirTelaCadastro({Fornecedor? fornecedor}) {
    String textoAcaoUsuario = "";
    if (fornecedor == null) {
      _cnpjController.text = "";
      _nomeController.text = "";
      _telefoneController.text = "";
      textoAcaoUsuario = "Salvar";
    } else {
      _cnpjController.text = fornecedor.cnpj;
      _nomeController.text = fornecedor.nome;
      _telefoneController.text = fornecedor.telefone;
      textoAcaoUsuario = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$textoAcaoUsuario fornecedor"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nomeController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  hintText: "Digite o nome...",
                ),
              ),
              TextField(
                controller: _cnpjController,
                decoration: const InputDecoration(
                  labelText: "CNPJ",
                  hintText: "Digite o CNPJ...",
                ),
              ),
              TextField(
                controller: _telefoneController,
                decoration: const InputDecoration(
                  labelText: "Telefone",
                  hintText: "Digite o telefone...",
                ),
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
                _salvarAtualizarFornecedor(fornecedorSelecionado: fornecedor);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _recuperarFornecedor() async {
    List fornecedoresRecuperados = await _fornecedorHelper.recuperarAnotacoes();
    List<Fornecedor> listaTemporaria = <Fornecedor>[];
    for (var item in fornecedoresRecuperados) {
      Fornecedor fornecedor = Fornecedor(
        item["nome"],
        item["cnpj"],
        item["telefone"],
        id: item["id"],
      );
      listaTemporaria.add(fornecedor);
    }
    setState(() {
      _fornecedores = listaTemporaria;
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
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  _salvarAtualizarFornecedor({Fornecedor? fornecedorSelecionado}) async {
    String nome = _nomeController.text;
    String cnpj = _cnpjController.text;
    String telefone = _telefoneController.text;

    if (fornecedorSelecionado == null) {
      Fornecedor fornecedor = Fornecedor(nome, cnpj, telefone);
      int resultado = await _fornecedorHelper.salvarFornecedor(fornecedor);
      if (resultado == 0) {
        _showDialogMessage("Erro ao salvar fornecedor");
      } else {
        _showDialogMessage("Fornecedor salvo com sucesso");
      }
      _cnpjController.clear();
      _nomeController.clear();
      _telefoneController.clear();
      _recuperarFornecedor();
      return;
    }
    fornecedorSelecionado.nome = nome;
    fornecedorSelecionado.cnpj = cnpj;
    fornecedorSelecionado.telefone = telefone;
    int resultado =
        await _fornecedorHelper.atualizarFornecedor(fornecedorSelecionado);
    if (resultado == 0) {
      _showDialogMessage("Erro ao atualizar fornecedor");
    } else {
      _showDialogMessage("Fornecedor atualizado com sucesso");
    }
    _cnpjController.clear();
    _nomeController.clear();
    _telefoneController.clear();
    _recuperarFornecedor();
  }

  _removerFornecedor(int? id) async {
    if (id == null) {
      _showDialogMessage("Erro ao remover fornecedor");
      return;
    }
    await _fornecedorHelper.removerFornecedor(id);
    _showDialogMessage("Fornecedor removido com sucesso");
    _recuperarFornecedor();
  }

  @override
  void initState() {
    super.initState();
    _recuperarFornecedor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Fornecedores"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _fornecedores.length,
                  itemBuilder: (context, index) {
                    final fornecedor = _fornecedores[index];
                    return Card(
                      child: ListTile(
                        title: Text(fornecedor.nome),
                        subtitle: Text(
                            "CNPJ: ${fornecedor.cnpj} - Telefone: ${fornecedor.telefone}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(fornecedor: fornecedor);
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
                                _removerFornecedor(fornecedor.id);
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
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
