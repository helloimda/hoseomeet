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
      "type": "배달",
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
      "type": "배달",
      "title": "저녁 모임",
      "content": "저녁에 함께 영화 봐요!",
      "join_people": 4,
      "max_people": 12,
      "gender": "무관",
      "page_view": 13,
      "created_at": "2024-08-14T18:00:00Z"
    },
    {
      "id": 126,
      "type": "택시",
      "title": "저녁 모임",
      "content": "저녁에 함께 영화 봐요!",
      "join_people": 4,
      "max_people": 12,
      "gender": "무관",
      "page_view": 13,
      "created_at": "2024-08-14T18:00:00Z"
    },
    {
      "id": 127,
      "type": "모임",
      "title": "저녁 모임",
      "content": "저녁에 함께 영화 봐요!",
      "join_people": 4,
      "max_people": 12,
      "gender": "무관",
      "page_view": 13,
      "created_at": "2024-08-14T18:00:00Z"
    },
  ];

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  String formatTimestamp(String timestamp) {
    DateTime postDate = DateTime.parse(timestamp);
    DateTime now = DateTime.now();
    Duration difference = now.difference(postDate);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else {
      return '${difference.inDays}일 전';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, // AppBar의 기본 그림자 제거
        scrolledUnderElevation: 0, // 스크롤 시에도 그림자가 생기지 않도록 설정
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0), // 아이콘 크기에 맞게 패딩 조정
                  child: Image.asset(
                    'assets/img/icon/search-icon.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                isDense: true, // 검색바가 더 컴팩트하게 보이도록 설정
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0, // 그림자 효과
                  offset: Offset(0, 2), // 그림자의 위치 조정
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // 이 ListView는 스크롤 불가하게 설정
              shrinkWrap: true, // 부모 ListView의 공간을 사용할 수 있도록 설정
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostItem(post);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 플로팅 버튼 클릭 시 동작
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPostItem(Map<String, dynamic> post) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 27.0), // 패딩 조정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 카테고리 라벨
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red), // 빨간 테두리로 표시
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  post["type"],
                  style: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
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
            style: TextStyle(fontSize: 12 ,color: Colors.grey[600],fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // 타임스탬프, 조회수, 참가자 수
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${formatTimestamp(post["created_at"])} · 조회 ${post["page_view"]}',
                style: TextStyle(color: Colors.grey, fontSize: 11,fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/img/icon/joinuser.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${post["join_people"]}/${post["max_people"]}',
                    style: TextStyle(color: Colors.grey, fontSize: 11,fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: Colors.red, thickness: 1.0), // 게시글 분리선
        ],
      ),
    );
  }
}
