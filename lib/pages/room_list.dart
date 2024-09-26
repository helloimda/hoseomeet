import 'package:flutter/material.dart';

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 자취방 리스트 데이터
    final List<Map<String, dynamic>> rooms = [
      {
        "name": "퍼스트빌",
        "distance": "152m",
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
        "distance": "152m",
        "reviews": 37,
        "image": "assets/img/info/room3.png",
        "description": "신선한 재료로 만든 건강한 맛, 최고의 맛집!",
        "rating": 4.0
      },
    ];

    return ListView.builder(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 20),
                          SizedBox(width: 5),
                          Text(room['rating'].toString()),
                          SizedBox(width: 10),
                          Text(room['distance']),
                          SizedBox(width: 10),
                          Text('리뷰 ${room['reviews']}'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        room['description'],
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // 좋아요 버튼
                Icon(Icons.favorite_border, color: Colors.red),
              ],
            ),
          ),
        );
      },
    );
  }
}
