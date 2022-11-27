import '../model/FornecedorModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FornecedorHelper {
  static final String nomeTabela = "fornecedor";

  static final FornecedorHelper _fornecedorHelper =
      FornecedorHelper._internal();
  Database? _db;

  factory FornecedorHelper() {
    return _fornecedorHelper;
  }

  FornecedorHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "nome VARCHAR, "
        "cnpj VARCHAR, "
        "telefone VARCHAR)";
    await db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "fonecedores_trabalho_03_11_bhryan_anna.db");
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarFornecedor(Fornecedor fornecedor) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, fornecedor.toMap());
    return resultado;
  }

  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY id DESC ";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarFornecedor(Fornecedor fornecedor) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, fornecedor.toMap(),
        where: "id = ?", whereArgs: [fornecedor.id]);
  }

  Future<int> removerFornecedor(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
