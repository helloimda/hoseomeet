import 'package:flutter/material.dart';
import '../widgets/category_button.dart';

class MeetPage extends StatefulWidget {
  @override
  _MeetPageState createState() => _MeetPageState();
}

class _MeetPageState extends State<MeetPage> {
  String selectedCategory = "전체"; // 초기 선택된 카테고리

  final List<Map<String, dynamic>> posts = [
    {
      "id": 123,
      "type": "모임",
      "title": "주말 모임",
      "content": "주말에 함께 모여 식사해요!",
      "join_people": 4,
      "max_people": 10,
      "gender": "무관",
      "page_view": 3,
      "created_at": "2024-08-12T10:00:00Z"
    },
    {
      "id": 124,
      "type": "모임",
      "title": "주중 모임",
      "content": "주중에 함께 산책해요!",
      "join_people": 4,
      "max_people": 8,
      "gender": "무관",
      "page_view": 23,
      "created_at": "2024-08-13T12:00:00Z"
    },
    {
      "id": 125,
      "type": "모임",
      "title": "저녁 모임",
      "content": "저녁에 함께 영화 봐요!",
      "join_people": 4,
      "max_people": 12,
      "gender": "무관",
      "page_view": 13,
      "created_at": "2024-08-14T18:00:00Z"
    }
  ];

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 카테고리 버튼들
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryButton(
                  text: "전체",
                  isSelected: selectedCategory == "전체",
                  onPressed: () {
                    _onCategorySelected("전체");
                  },
                ),
                CategoryButton(
                  text: "모임",
                  isSelected: selectedCategory == "모임",
                  onPressed: () {
                    _onCategorySelected("모임");
                  },
                ),
                CategoryButton(
                  text: "배달",
                  isSelected: selectedCategory == "배달",
                  onPressed: () {
                    _onCategorySelected("배달");
                  },
                ),
                CategoryButton(
                  text: "택시",
                  isSelected: selectedCategory == "택시",
                  onPressed: () {
                    _onCategorySelected("택시");
                  },
                ),
                CategoryButton(
                  text: "카풀",
                  isSelected: selectedCategory == "카풀",
                  onPressed: () {
                    _onCategorySelected("카풀");
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.red, thickness: 1.0),
          // 게시글 리스트
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostItem(post);
              },
            ),
          ),
          // 하단 플로팅 액션 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  // 플로팅 버튼 클릭 시 동작
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(Map<String, dynamic> post) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 카테고리 라벨
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      post["type"],
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // 제목
              Text(
                post["title"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // 설명
              Text(
                post["content"],
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              // 인원, 시간, 조회수
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '인원: ${post["join_people"]}/${post["max_people"]} · ${post["gender"]}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    '${post["page_view"]} 조회수',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '작성일: ${post["created_at"]}',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
