import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/colog.dart';

class Home0820 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            color: Colors.green[100],
            child: CustomPaint(painter: _MyPainter()),
          ),
        ],
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas => 그리기 위한 메서드들이 존재하는 객체!
    // size => CustomPaint 가 가지고 있는 크기 => 부모위젯으로부터 물려받은 크기

    // Paint 객체 : 붓. 색상, 두께, 끝 둥글게 처리할지...
    Paint brush = Paint();
    brush.color = Colors.pinkAccent;
    // canvas.drawCircle(Offset(150, 150), 50, p1);

    // 두번째 인자 : startAngle. 3시방향이 시작점.
    // 세번째 인자 : sweepAngle. 호의 각도.
    // 모두 호도법
    // 백분율 => 호도법
    // 15% 10% 20% 18% 7% 30%
    // 핑크, 주황, 초록, 청록, 파랑, 인디고
    final center = Offset(size.width / 2, size.height / 2);

    final values = [15, 10, 20, 18, 7, 30];
    final colors = [
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
    ];

    double startAngle = -90.toRadian();
    double radius = size.width / 3;

    for (var i = 0; i < values.length; i++) {
      final percentage = values[i];
      final color = colors[i];
      double sweepAngle = percentage.percentageToRadian();

      Rect rect2 = Rect.fromCircle(center: center, radius: radius);
      brush.color = color;
      canvas.drawArc(rect2, startAngle, sweepAngle, true, brush);

      startAngle = startAngle + sweepAngle;
      radius = radius + 5;
    }
  }

  // _MyPainter 객체의 속성이 바뀌었을 때 호출되는 함수
  // 반환되는 값이 ture 이면 다시 그림!
  // false 다시 그리지 않음!
  // 다시 그릴지 여부!
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension DoubleExt on double {
  double toRadian() {
    // x / 360 * 2 * pi
    return this / 360 * 2 * pi;
  }

  /// ## 백분율을 호도법으로 변환
  ///
  /// `percentage / 100 * 2 * pi`
  ///
  /// ex)
  ///
  /// - 25.percentageToRadian() => pi / 2
  /// - 50.percentageToRadian() => pi
  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}

extension IntExt on int {
  double toRadian() {
    // x / 360 * 2 * pi
    return this / 360 * 2 * pi;
  }

  /// ## 백분율을 호도법으로 변환
  ///
  /// `percentage / 100 * 2 * pi`
  ///
  /// ex)
  ///
  /// - 25.percentageToRadian() => pi / 2
  /// - 50.percentageToRadian() => pi
  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}
