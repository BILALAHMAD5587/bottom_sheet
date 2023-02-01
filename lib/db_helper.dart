import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper{

  var userTable = 'user';
  var colunmId = 'user';
  var colunmname = 'userName';
  var columnEmail = 'userEmail';
  var columnMobNo = 'userMobNo';
  var columnPass = 'colunmPass';


  Future<Database> openDB() async{
    var direcetory = await getApplicationDocumentsDirectory();

    await direcetory.create(recursive: true);
    var path = "${direcetory.path}user_db.db";
    return await openDatabase(path, version: 1, onCreate: (db, version){

      var query = "create table $userTable ($colunmId integer primary key autoincrement, $colunmname text, $columnEmail text, $columnMobNo text, $columnPass text)";

      db.execute(query);
    });

  }

  void signUp(String name, String email, String mobno, String pass)async{
    var myDB = await openDB();
    myDB.insert(userTable, {colunmname: name, columnEmail: email, columnMobNo: mobno, columnPass: pass});
  }

  Future<bool> isEmailExtis(String email) async{
    var myDB = await openDB();

    var data = await myDB.query(userTable, where: "$columnEmail = ?", whereArgs: [email]);
    if(data.isNotEmpty){
      return true;
    }else {
      return false;
    }
  }

  Future<bool> Authenticate(String email, String pass)async{
    var myDB = await openDB();

    var data = await myDB.query(userTable, where: "$columnEmail = ? and $columnPass = ?", whereArgs: [email, pass] );

    if(data.isNotEmpty){
      return true;
    } else {
      return false;
    }
  }

}