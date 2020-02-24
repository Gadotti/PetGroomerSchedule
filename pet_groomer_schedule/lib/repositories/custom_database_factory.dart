import 'package:pet_groomer_schedule/models/schedule_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CustomDatabaseFactory {
  static final CustomDatabaseFactory _instance = CustomDatabaseFactory.internal();
  factory CustomDatabaseFactory() => _instance;

  CustomDatabaseFactory.internal();  

  Database _database;

  Future<Database> get db async {
    if (_database != null) {
      print(' > reaproveitando o db');
      return _database;
    }
    else {
      print(' > inciando novo db');
      _database = await initDb();
      return _database;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "pet_groomer_schedule.db");

    return await openDatabase(path, version: 2, onCreate: (Database db, int newerVersion) async {
      await db.execute(        
        "CREATE TABLE ${ScheduleModel.tableName} (" +
          "${ScheduleModel.idColumn} INTEGER PRIMARY KEY, "
          "${ScheduleModel.dateColumn} INTEGER, " +
          "${ScheduleModel.timeColumn} INTEGER, " +
          "${ScheduleModel.clientColumn} TEXT, " +
          "${ScheduleModel.taskColumn} TEXT, " +
          "${ScheduleModel.isFinishColumn} INTEGER)"
      );
    });
  }

  Future close() async {
    Database dbFactory = await db;
    dbFactory.close();
  }
}

