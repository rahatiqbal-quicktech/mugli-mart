import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AnotherSqlHelper {
  String dbname = "wishlistdb";
  String tablename = "wishlisttable";
  Database? myDatabase;

  Future<void> initialize() async {
    String DatabasePath = await getDatabasesPath();
    String CompletePath = join(DatabasePath, dbname);

    await openDatabase(CompletePath, version: 1,
        //
        onCreate: (db, version) async {
      String command =
          "CREATE TABLE $tablename (id TEXT PRIMARY KEY, productname TEXT, productprice REAL, productimage TEXT)";
      await db.execute(command);
      myDatabase = db;
    },
        //
        onOpen: (db) {
      myDatabase = db;
    });
  }

  Future<int> addProduct(String id, String productname, double productprice,
      String productimage) async {
    Map<String, dynamic> dataMap = {
      "id": id,
      "productname": productname,
      "productprice": productprice,
      "productimage": productimage
    };
    try {
      Fluttertoast.showToast(msg: "Product added to wishlist");
      return await myDatabase!.insert(tablename, dataMap);
    } catch (e) {
      print(e.toString());
      print("Already Exists ");
      Fluttertoast.showToast(msg: "Product already added in wishlist before");
      return 3;
    }
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return await myDatabase!.query(tablename);
  }

  Future<int> deleteProduct(String id) async {
    return await myDatabase!.delete(tablename, where: "id=?", whereArgs: [id]);
  }

  // Future deleteTable() async {
  //   await myDatabase!.execute("DROP TABLE IF EXISTS $tablename");
  // }
}
