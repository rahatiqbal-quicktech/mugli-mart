import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  Database? database;
  final String dbName = "muglidb.db";
  final String productsTable = "products";

  Future<void> _onCreate(Database db, int version) async {
    String createTableQuery =
        "CREATE TABLE $productsTable (id TEXT PRIMARY KEY, productname TEXT, productprice REAL, productimage TEXT)";
    await db.execute(createTableQuery);
    database = db;
  }

  Future<void> _onOpen(Database db) async {
    database = db;
  }

  Future<void> initialize() async {
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, dbName);
    await openDatabase(databaseName,
        version: 3, onCreate: _onCreate, onOpen: _onOpen);
  }

  Future<int> addProduct(String id, String productname, double productprice,
      String productimage) async {
    Map<String, dynamic> dataMap = {
      "id": id,
      "productname": productname,
      "productprice": productprice,
      "productimage": productimage
    };

    return await database!.insert(productsTable, dataMap);
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return await database!.query(productsTable);
  }

  Future<Map<String, dynamic>> fetchProductById(String id) async {
    List<Map<String, dynamic>> data =
        await database!.query(productsTable, where: "id=?", whereArgs: [id]);
    return data[0];
  }

  Future<int> deleteProduct(String id) async {
    return await database!
        .delete(productsTable, where: "id=?", whereArgs: [id]);
  }
}
