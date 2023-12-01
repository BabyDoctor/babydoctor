import 'dart:convert';
import 'diary.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  //일정 반환
  static Future<List<Schedule>> getSchedules() async {
    final url = Uri.parse('$baseUrl/schedule/');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Error();
    }
    final List<dynamic> schedules = jsonDecode(utf8.decode(response.bodyBytes));
    List<Schedule> scheduleInstances =
    schedules.map((schedule) => Schedule.fromJson(schedule)).toList();
    return scheduleInstances;
  }


  //일정 추가
  static Future<bool> addSchedule(Schedule schedule) async {
    final url = Uri.parse('$baseUrl/schedule/');
    final body = jsonEncode(schedule);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  //일정 삭제
  static Future<bool> deleteSchedules(int scheduleID) async {
    final url = Uri.parse('$baseUrl/schedule/$scheduleID');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }
}
