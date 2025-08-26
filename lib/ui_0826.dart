import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/colog.dart';

// SliverAppBar : CustomScrollView에서 AppBar 사용하고 싶을 때
// SliverToBoxAdapter : 일반위젯을 CustomScrollView에서 사용하고 싶을 때
// SliverList : ListView를 CustomScrollView에서 사용하고 싶을 때
// SliverPersistentHeader : 항상 표시되는 Sliver
class Home0826 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ListView, SingleChildScrollView 는 전체가 하나의 영역으로 스크롤이 되었음
    // CustomScrollView 는 그 영역을 세세하게 조절할 수 있는 위젯
    // => 세세하게 조정하는 영역을 Sliver (스크롤 영역의 조각)
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // ListView 의 children 에 해당하는 속성!
        // Widget 이 들어가지 않고
        // 스크롤 영역의 조각 객체 (Sliver) 가 들어감
        slivers: [
          // SliverAppBar(
          //   // 최소 높이가 되었을때 더이상 스크롤되지 않고 고정할지 여부
          //   pinned: true,
          //   title: Text('슬리버 앱바'),
          //   // flexibleSpace 의 최대 높이
          //   expandedHeight: 300,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('플렉시블 스페이스'),
          //     background: Opacity(
          //       opacity: .5,
          //       child: Image.network(
          //         'https://picsum.photos/200/300',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          // 스크롤 영역을 조금 더 자유롭게 구현!
          SliverPersistentHeader(
            // minExtent 밑으로 줄어들지 않음!
            pinned: true,
            // pinned false 로 주고 많이 사용
            // floating true 로 주게되면 현재 스크롤의 위치가
            // 최상단이 아니더라도 스크롤 아래로 이동하면 나타남
            // floating: true,
            delegate: MySliver(),
            //
          ),
          // 위젯과 Sliver 사이의 다리 역할
          // CustomScrollView 내에서 일반 위젯 사용하고 싶을 때 사용!
          SliverToBoxAdapter(child: Text("어댑터")),
          // 들어가는 속성 및 객체 이름만 다르고
          // 위젯을 반환하는 함수는 ListView.builder 의 itemBuilder 속성에 들어가는
          // 함수와 동일!
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // 원이랑 선은 노란색
                // 글자는 검은색
                // 글자 : OOOOOOOOOOOOO
                // 거리 글자 : 00.0 km
                // 왼쪽 숫자 : 1~10
                // TODO 내일 아침에 코딩 시간 15분정도 더 하고 구현
                return Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.amber,
                  margin: EdgeInsets.all(10),
                  child: Text('$index'),
                );
              },
              // ListView.builder 의 itemCount 속성과 동일!
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MySliver extends SliverPersistentHeaderDelegate {
  // 그릴 위젯 반환
  // CustomScrollView 가 스크롤 될 때
  // MySliver 의 높이가 변경될 때 호출
  // shrinkOffset => 현재 MySliver 의 위치
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    print("MySliver shrinkOffset : $shrinkOffset");
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          child: Center(child: Text('구글 지도 영역')),
          //
        ),
        //
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }

  // 최대 높이
  @override
  double get maxExtent => 600;

  // 최소 높이
  @override
  double get minExtent => 300;

  // MySliver 의 속성이 변경되었을 때 다시 그릴지 여부
  // CustomPainter 사용할 때 사용했던 그 메서드!
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
