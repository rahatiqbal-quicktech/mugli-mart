import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartSqlHelper {
  String dbname = "cartdb";
  String tablename = "carttable";
  Database? myDatabase;

  Future<void> initialize() async {
    String DatabasePath = await getDatabasesPath();
    String CompletePath = join(DatabasePath, dbname);

    await openDatabase(CompletePath, version: 5,
        //
        onCreate: (db, version) async {
      String command =
          "CREATE TABLE $tablename (product_id TEXT PRIMARY KEY, product_name TEXT, sellerid INTEGER, product_price REAL, quantity INTEGER, productSize TEXT, productColor TEXT, productimage TEXT)";
      await db.execute(command);
      myDatabase = db;
    },
        //
        onOpen: (db) {
      myDatabase = db;
    });
  }

  Future<int> addProduct(
      {String? id,
      String? productname,
      int? sellerId,
      int? productPrice,
      int? quantitiy,
      String? productSize,
      String? productColor,
      String? productimage}) async {
    Map<String, dynamic> dataMap = {
      "product_id": id,
      "product_name": productname,
      "sellerid": sellerId,
      "product_price": productPrice,
      "quantity": quantitiy,
      "productSize": productSize,
      "productColor": productColor,
      "productimage": productimage
    };
    try {
      Fluttertoast.showToast(msg: "Product added to cart.");
      return await myDatabase!.insert(tablename, dataMap);
    } catch (e) {
      print(e.toString());
      print("Already Exists ");
      return 3;
    }
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return await myDatabase!.query(tablename);
  }

  Future<int> deleteProduct(String id) async {
    print("Product deleted");
    return await myDatabase!
        .delete(tablename, where: "product_id=?", whereArgs: [id]);
  }

  // Future deleteTable() async {
  //   await myDatabase!.execute("DROP TABLE IF EXISTS $tablename");
  // }

  Future<double> totalPrice() async {
    List<Map<String, dynamic>>? tempList;
    tempList = await fetchProducts();
    double totalPrice = 0;

    if (tempList != null) {
      for (var i in tempList) {
        totalPrice = (totalPrice + i['product_price'] * i['quantity']);
      }
    }
    return totalPrice;
  }

  Future<void> clearCart() async {
    // await database?.delete(tablename, where: 'id = ?', whereArgs: [id]);
    print("celarCart function");
    await myDatabase!.execute("DELETE FROM $tablename");
  }
}
