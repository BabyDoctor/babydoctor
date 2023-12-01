class Schedule {
  final int? scheduleId;
  final String event, temp, year, month, day;
  final String? time, detail;

  Schedule(
      {this.scheduleId,
        required this.event,
        required this.temp,
        required this.year,
        required this.month,
        required this.day,
        this.time,
        this.detail});

  Map<String, dynamic> toJson() {
    return {
      'id': scheduleId,
      'event': event,
      'temp': temp,
      'year' : year,
      'month': month,
      'day': day,
      'time': time,
      'detail' : detail,
    };
  }

  Schedule.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        temp = json['temp'],
        year = json['year'],
        month = json['month'],
        day = json['day'],
        time = json['time'],
        scheduleId = json['id'],
        detail = json['detail'];
}
