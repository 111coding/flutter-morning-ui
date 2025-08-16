import 'dart:math';

import 'package:flutter/material.dart';

class LottoPage extends StatefulWidget {
  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  List<Set<int>> results = [];

  @override
  Widget build(BuildContext context) {
    List<Row> rowList = [];
    if (results.isEmpty) {
      rowList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numberBox('?'),
            numberBox('?'),
            numberBox('?'),
            numberBox('?'),
            numberBox('?'),
            numberBox('?'),
          ],
        ),
      );
    } else {
      for (var result in results) {
        List<int> numberList = result.toList();
        numberList.sort();
        List<String> numbetStringList = [];
        for (int n in numberList) {
          numbetStringList.add('$n');
        }
        rowList.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberBox(numbetStringList[0]),
              numberBox(numbetStringList[1]),
              numberBox(numbetStringList[2]),
              numberBox(numbetStringList[3]),
              numberBox(numbetStringList[4]),
              numberBox(numbetStringList[5]),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('로또번호 생성기')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '추천번호',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //
            ),
          ),
          SizedBox(height: 20),
          ...rowList,
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Set<int> newNumbers = {};
                Random random = Random();
                while (newNumbers.length < 6) {
                  int randomValue = random.nextInt(45); // 0 이상 45 미만
                  newNumbers.add(randomValue + 1);
                }

                setState(() {
                  if (results.length == 5) {
                    results.removeAt(0);
                  }
                  results.add(newNumbers);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              child: Text('생성하기'),
            ),
          ),
        ],
      ),
    );
  }

  Widget numberBox(String number) {
    // 10 이하 amber
    // 20 이하 blue
    // 30 이하 red
    // 40 이하 grey
    // 45 이하 green
    // 물음표 => purple
    int? parsedNumber = int.tryParse(number);
    Color color = Colors.purple;
    if (parsedNumber != null) {
      if (parsedNumber <= 10) {
        color = Colors.amber;
      } else if (parsedNumber <= 20) {
        color = Colors.blue;
      } else if (parsedNumber <= 30) {
        color = Colors.red;
      } else if (parsedNumber <= 40) {
        color = Colors.grey;
      } else {
        color = Colors.green;
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 5),
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.only(bottom: 10),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        number,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          //
        ),
      ),
    );
  }
}
