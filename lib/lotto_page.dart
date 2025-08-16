import 'dart:math';

import 'package:flutter/material.dart';

class LottoPage extends StatefulWidget {
  @override
  State<LottoPage> createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  Set<int> numberSet = {};

  @override
  Widget build(BuildContext context) {
    List<int> numberList = numberSet.toList();
    numberList.sort();
    List<String> numbetStringList = [];
    for (int n in numberList) {
      numbetStringList.add('$n');
    }
    if (numbetStringList.isEmpty) {
      numbetStringList = ['?', '?', '?', '?', '?', '?'];
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
                  numberSet = newNumbers;
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber, width: 5),
        shape: BoxShape.circle,
      ),
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
