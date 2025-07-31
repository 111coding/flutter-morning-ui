import 'package:flutter/material.dart';

// 달력 출력
// DateTime.now()
class Home0729 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 어떤 날짜를 입력받더라도 해당 날짜가 속해있는 달의 달력 출력!
    // DateTime date = DateTime.now();
    // DateTime date = DateTime(2025, 02, 02);
    DateTime date = DateTime(2024, 02, 15);
    DateTime beginDate = DateTime(date.year, date.month, 1);
    final endOfmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int endDate = endOfmonths[date.month - 1];
    if (date.month == 2 && date.year % 4 == 0) {
      endDate = 29;
    }
    int weekday = beginDate.weekday == 7 ? 0 : beginDate.weekday;

    List<String> days = [];
    for (var i = 0; i < weekday; i++) {
      days.add('');
    }
    for (var i = 1; i <= endDate; i++) {
      days.add("$i");
    }
    while (days.length % 7 != 0) {
      days.add('');
    }

    int weekCount = (days.length / 7).ceil();

    return Scaffold(
      appBar: AppBar(title: Text('달력')),
      body: Column(
        children: [
          // 1. Row 이용해서 구현
          labelRow(),
          week([days[0], days[1], days[2], days[3], days[4], days[5], days[6]]),
          SizedBox(height: 4),
          week([
            days[7],
            days[8],
            days[9],
            days[10],
            days[11],
            days[12],
            days[13],
          ]),
          SizedBox(height: 4),
          week([
            days[14],
            days[15],
            days[16],
            days[17],
            days[18],
            days[19],
            days[20],
          ]),
          SizedBox(height: 4),
          week([
            days[21],
            days[22],
            days[23],
            days[24],
            days[25],
            days[26],
            days[27],
          ]),
          SizedBox(height: 4),
          if (weekCount > 4)
            week([
              days[28],
              days[29],
              days[30],
              days[31],
              days[32],
              days[33],
              days[34],
            ]),
          // 2. GridView 이용해서 구현
          if (weekCount > 5)
            week([
              days[35],
              days[36],
              days[37],
              days[38],
              days[39],
              days[40],
              days[41],
            ]),
          grid(),
        ],
      ),
    );
  }

  Widget grid() {
    DateTime date = DateTime.now();

    DateTime beginDate = DateTime(date.year, date.month, 1);
    final endOfmonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int endDate = endOfmonths[date.month - 1];
    if (date.month == 2 && date.year % 4 == 0) {
      endDate = 29;
    }
    int weekday = beginDate.weekday == 7 ? 0 : beginDate.weekday;

    List<Widget> days = [];
    for (var i = 0; i < weekday; i++) {
      days.add(gridItem(''));
    }
    for (var i = 1; i <= endDate; i++) {
      days.add(gridItem("$i"));
    }

    return Container(
      height: 300,
      color: Colors.blue,
      child: GridView.count(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
        children: days,
      ),
    );
  }

  Widget gridItem(String day) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: day.isEmpty ? null : Colors.grey[400],
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(day),
    );
  }

  Widget week(List<String> days) {
    return Row(
      children: [
        day(days[0]),
        day(days[1]),
        day(days[2]),
        day(days[3]),
        day(days[4]),
        day(days[5]),
        day(days[6]),
      ],
    );
  }

  Widget day(String day) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: day.isEmpty ? null : Colors.grey[300],
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(day),
      ),
    );
  }

  Widget labelRow() {
    return Row(
      children: [
        label("일", Colors.red[900]!),
        label("월"),
        label("화"),
        label("수"),
        label("목"),
        label("금"),
        label("토", Colors.blue[900]!),
      ],
    );
  }

  Widget label(String day, [Color? color]) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
