import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TODO: 여기에 지도 API 출력 예정 (예시로 빈 배경을 둠)
          Container(
            color: Colors.grey.shade300,
          ),

          // 상단 검색바와 카테고리 탭
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 검색 바
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: '장소를 검색하세요',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // 카테고리 탭
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('자취방'),
                      _buildCategoryButton('음식점'),
                      _buildCategoryButton('카페'),
                      _buildCategoryButton('술집'),
                      _buildCategoryButton('편의점'),
                      _buildCategoryButton('놀거리'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 슬라이드 패널
          SlidingUpPanel(
            minHeight: 150, // 최소 높이
            maxHeight: MediaQuery.of(context).size.height * 0.6, // 최대 높이
            panel: _buildSlidingPanel(), // 슬라이드 패널의 내용
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리 버튼 빌더
  Widget _buildCategoryButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.red, backgroundColor: Colors.white,
          side: BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  // 슬라이드 패널의 내용 빌드
  Widget _buildSlidingPanel() {
    return Column(
      children: [
        SizedBox(height: 12.0),
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        SizedBox(height: 18.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "지금 소소님을 기다리고 있어요!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.restaurant, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          '배달로 때문에 같이 주문 하실 분 구해요',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '저는 정문 쪽에 거주하고 있습니다.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('호서대 · 1시간 전 · 조회 14'),
                        Text('1/3', style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
