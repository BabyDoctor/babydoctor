import 'api.dart';
import 'diary.dart';
import 'package:flutter/material.dart';

class ScheduleListProvider extends ChangeNotifier {
  List<Schedule> _scheduleListByDate = [];

  List<Schedule> get scheduleListByDate => _scheduleListByDate;

  Future<void> updateScheduleList() async {
    _scheduleListByDate = await ApiService.getSchedules();
    notifyListeners();
  }


  Future<void> deleteScheduleList(int scheduleId) async {
    bool result = await ApiService.deleteSchedules(scheduleId);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    updateScheduleList();
  }

  Future<void> addScheduleList(Schedule schedule) async {
    bool result = await ApiService.addSchedule(schedule);
    if (result) {
      print('추가 성공!');
    } else {
      print('추가 실패');
    }
    _scheduleListByDate.add(schedule);

    notifyListeners();
  }

}
