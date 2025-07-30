import 'package:flutter/material.dart';

// 달력 출력
// DateTime.now()
class Home0729 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('달력')),
      body: Column(
        children: [
          // 1. Row 이용해서 구현
          labelRow(),
          week(['', '', '1', '2', '3', '4', '5']),
          SizedBox(height: 4),
          week(['6', '7', '8', '9', '10', '11', '12']),
          SizedBox(height: 4),
          week(['13', '14', '15', '16', '17', '18', '19']),
          SizedBox(height: 4),
          week(['20', '21', '22', '23', '24', '25', '26']),
          SizedBox(height: 4),
          week(['27', '28', '29', '30', '31', '', '']),
          // 2. GridView 이용해서 구현
          grid(),
        ],
      ),
    );
  }

  Widget grid() {
    DateTime dateTime = DateTime.now();
    List<Widget> days = List.generate(33, (index) {
      final value = index - 1;
      return gridItem(value <= 0 ? "" : "$value");
    });
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
