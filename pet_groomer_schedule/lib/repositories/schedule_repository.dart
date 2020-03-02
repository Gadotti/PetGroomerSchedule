import 'package:pet_groomer_schedule/controllers/schedule_controller.dart';
import 'package:pet_groomer_schedule/helpers/dateTime_helper.dart';
import 'package:pet_groomer_schedule/models/schedule_model.dart';

import 'custom_database_factory.dart';

class ScheduleRepository {
  
  Future<List<ScheduleController>> getSchedulesList(DateTime date) async {
    print('>>> foi no banco (get). Dia ${date.day}');
    //await new Future.delayed(const Duration(seconds: 1));

    final db = await CustomDatabaseFactory().db;
    final listMap = await db.query(
      ScheduleModel.tableName,
      where: "${ScheduleModel.dateColumn} = ?",
      whereArgs: [DateTimeHelper.dateTimeToEpoch(date)]);
    final schduleList = List<ScheduleController>();

    for (Map map in listMap) {
      schduleList.add(ScheduleControllerBase.fromMap(map));
    }

    return schduleList;
  }

  Future<int> insert(ScheduleController schedule) async {
    final db = await CustomDatabaseFactory().db;
    return await db.insert(ScheduleModel.tableName, schedule.toMap());
  }

  Future<int> delete(int id) async {
    final db = await CustomDatabaseFactory().db;
    return await db.delete(
      ScheduleModel.tableName,
      where: "${ScheduleModel.idColumn} = ?",
      whereArgs: [id]
    );
  }
}