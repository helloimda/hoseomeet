import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double panelHeightOpen = MediaQuery.of(context).size.height * 0.73; // 슬라이드 패널이 완전히 열렸을 때 높이
    final double panelHeightClosed = 150.0; // 슬라이드 패널이 닫혔을 때 높이 (카테고리 탭 바로 아래까지)

    return Scaffold(
      body: Stack(
        children: [
          // 지도 또는 백그라운드
          Center(
            child: Text('지도 API 백그라운드'),  // 여기에는 지도 API 연동 코드가 들어가야 합니다.
          ),

          // 검색바
          Positioned(
            top: 15,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "장소, 음식점, 카페 검색",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 카테고리 탭
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(), // 좌우 슬라이드 가능하게 설정
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                children: [
                  _buildCategoryButton('자취방', 'assets/img/icon/mainpage/roomtype.png'),
                  _buildCategoryButton('음식점', 'assets/img/icon/mainpage/foodtype.png'),
                  _buildCategoryButton('카페', 'assets/img/icon/mainpage/cafetype.png'),
                  _buildCategoryButton('술집', 'assets/img/icon/mainpage/bartype.png'),
                  _buildCategoryButton('편의점', 'assets/img/icon/mainpage/shoptype.png'),
                  _buildCategoryButton('놀거리', 'assets/img/icon/mainpage/playtype.png'),
                ],
              ),
            ),
          ),

          // 슬라이드 패널
          SlidingUpPanel(
            minHeight: panelHeightClosed, // 패널이 닫혔을 때 높이
            maxHeight: panelHeightOpen,  // 패널이 열렸을 때 높이
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            panel: _buildPanelContent(), // 패널 내부의 내용
            body: Container(),  // 패널 뒤에 있는 지도나 다른 내용
          ),
        ],
      ),
    );
  }

  // 카테고리 버튼 빌드 함수
  Widget _buildCategoryButton(String text, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 6), // 버튼 간격을 약간 넓게 유지
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8), // 부드러운 패딩 값
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
          side: BorderSide(color: Colors.grey),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 20, // 아이콘 크기 유지
              height: 20,
            ),
            SizedBox(width: 6), // 아이콘과 텍스트 간격을 적절히 유지
            Text(
              text,
              style: TextStyle(fontSize: 14), // 텍스트 크기를 줄여서 정돈된 느낌 제공
            ),
          ],
        ),
      ),
    );
  }

  // 패널 내부 내용 빌드 함수
  Widget _buildPanelContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Center(
          child: Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '지금 소소님을 기다리고 있어요!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.location_on),
                title: Text('배달로 때문에 같이 주문 하실 분 구해요'),
                subtitle: Text('호서대 근처 음식점'),
                trailing: Text('1시간 전'),
              );
            },
          ),
        ),
      ],
    );
  }
}
