import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class AppDatabase {

  //singleton instance
  static final AppDatabase _singleton = AppDatabase._();
  //singleton accessor
  static AppDatabase get instance => _singleton;

  // completer is used for transforming synchronous code into asynchronous code
  Completer<Database>? _dbOpenCompleter;

  // private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  AppDatabase._();

  //database object accessor
  Future<Database> get database async {
    // if completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if(_dbOpenCompleter == null){
      _dbOpenCompleter = Completer();
      // calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }

    // if the databse is already opened, awaiting the future will happen instantly
    // otherwise, awaiting the returned future will take some time - untile complete() is called
    // on the completer in _openDatabase() below
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    // get a platform specific dir where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, 'demo.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);
    //any code awaiting the completer's future will now start executing
    _dbOpenCompleter?.complete(database);
  }

}