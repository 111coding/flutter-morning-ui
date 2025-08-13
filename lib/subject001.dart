import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialPage extends StatefulWidget {
  @override
  State<DialPage> createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  String numbers = "";

  void updateNumbers(String nextNumbers) {
    nextNumbers = nextNumbers.replaceAll('-', '');
    if (!nextNumbers.startsWith("010")) {
      setState(() {
        numbers = nextNumbers;
      });
      return;
    }
    String result = "";

    for (int i = 0; i < nextNumbers.length; i++) {
      // 3번째 문자 뒤, 7번째 문자 뒤에 '-' 추가
      if (i == 3 || i == 7) {
        result += "-";
      }
      result += nextNumbers[i];
    }
    setState(() {
      numbers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(numbers, style: TextStyle(fontSize: 36)),
              ),
            ),
            Row(
              children: [
                numButton('1', ''),
                SizedBox(width: 20),
                numButton('2', 'A B C'),
                SizedBox(width: 20),
                numButton('3', 'D E F'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                numButton('4', 'G H I'),
                SizedBox(width: 20),
                numButton('5', 'J K L'),
                SizedBox(width: 20),
                numButton('6', 'M N O'),
              ],
            ),
            SizedBox(height: 20),

            Row(
              children: [
                numButton('7', 'P Q R S'),
                SizedBox(width: 20),
                numButton('8', 'T U V'),
                SizedBox(width: 20),
                numButton('9', 'W X Y Z'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                numButton('*', null),
                SizedBox(width: 20),
                numButton('0', '+'),
                SizedBox(width: 20),
                numButton('#', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (numbers.isEmpty) {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text("번호를 입력해 주세요"),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("확인"),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CallingPage(numbers);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(101, 196, 102, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (numbers.isEmpty) {
                        return;
                      }
                      updateNumbers(numbers.substring(0, numbers.length - 1));
                    },
                    child: SizedBox(
                      height: 90,
                      child: Icon(
                        CupertinoIcons.delete_left_fill,
                        color: Colors.grey,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  Widget numButton(String numberText, String? subText) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            updateNumbers(numbers + numberText);
          });
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numberText,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              if (subText != null)
                Text(
                  subText,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallingPage extends StatelessWidget {
  CallingPage(this.numbers);

  String numbers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                numbers,
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    button(CupertinoIcons.mic_slash_fill, "mute"),
                    button(CupertinoIcons.circle_grid_3x3_fill, "keypad"),
                    button(CupertinoIcons.speaker_2_fill, "speaker"),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    button(CupertinoIcons.add, "add call"),
                    button(CupertinoIcons.video_camera, "FaceTime"),
                    button(CupertinoIcons.person_crop_circle, "contacts"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.phone_down_fill,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button(IconData iconData, String text) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white12,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white, size: 36),
          ),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
