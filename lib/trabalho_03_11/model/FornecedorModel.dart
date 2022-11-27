import '../helper/FornecedorHelper.dart';

class Fornecedor {
  int? id;
  String nome;
  String cnpj;
  String telefone;

  Fornecedor(this.nome, this.cnpj, this.telefone, {this.id});

  Map toMap() {
    //retorna um map // converte um objeto em map
    Map<String, dynamic> map = {
      "nome": nome,
      "cnpj": cnpj,
      "telefone": telefone,
    };

    if (this.id != null) {
      //so retorna com id se ele existir
      map["id"] = this.id;
    }

    return map;
  }
}
