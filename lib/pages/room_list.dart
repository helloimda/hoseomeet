import 'package:flutter/material.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rooms = [
      {
        "name": "퍼스트빌",
        "distance": "150m",
        "reviews": 37,
        "image": "assets/img/info/room1.png",
        "description": "신선한 재료로 만든 건강한 맛, 최고의 맛집!",
        "rating": 4.0
      },
      {
        "name": "궁전빌라",
        "distance": "152m",
        "reviews": 37,
        "image": "assets/img/info/room2.png",
        "description": "신선한 재료로 만든 건강한 맛, 최고의 맛집!",
        "rating": 4.0
      },
      {
        "name": "솔원룸",
        "distance": "151m",
        "reviews": 37,
        "image": "assets/img/info/room3.png",
        "description": "신선한 재료로 만든 건강한 맛, 최고의 맛집!",
        "rating": 4.0
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Center(
          child: Container(
            height: 3,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        // 상단 텍스트
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '지금 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700, // Pretendard Bold
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '소소',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700, // Pretendard Bold
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: '님 주위에 있는 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700, // Pretendard Bold
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '자취방',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700, // Pretendard Bold
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              // 정렬 옵션 버튼
              DropdownButton<String>(
                value: '거리순',
                icon: Icon(Icons.keyboard_arrow_down),
                items: ['거리순', '별점순', '리뷰순']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // 정렬 방식 변경 처리 (구현 필요)
                },
              ),
            ],
          ),
        ),

        // 자취방 리스트
        Expanded(
          child: ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final room = rooms[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // 그림자 위치
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // 방 이미지
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              room['image'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          // 방 정보
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700, // Bold
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.red, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      room['rating'].toString(),
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400, // Regular
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      room['distance'],
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400, // Regular
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '리뷰 ${room['reviews']}',
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400, // Regular
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // 좋아요 버튼
                          Icon(Icons.favorite_border, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 10),
                      // 설명 텍스트
                      Text(
                        room['description'],
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
