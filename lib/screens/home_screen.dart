import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/meet_page.dart';
import '../pages/chat_page.dart';
import '../pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MeetPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로가기 화살표 숨김
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 아이콘 확대 효과 제거
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedLabelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold), // 라벨 크기 줄이고 굵게 설정
        selectedLabelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold), // 라벨 크기 줄이고 굵게 설정
        selectedItemColor: Color(0xFFE72410), // 활성화된 아이템의 라벨 색상 설정
        unselectedItemColor: Colors.grey, // 비활성화된 아이템의 라벨 색상 설정
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0 ? 'assets/img/icon/homered.png' : 'assets/img/icon/home.png',
              width: 30,
              height: 30,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1 ? 'assets/img/icon/meetred.png' : 'assets/img/icon/meet.png',
              width: 30,
              height: 30,
            ),
            label: 'MEET',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 2 ? 'assets/img/icon/chatred.png' : 'assets/img/icon/chat.png',
              width: 30,
              height: 30,
            ),
            label: 'CHAT',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 3 ? 'assets/img/icon/mered.png' : 'assets/img/icon/me.png',
              width: 30,
              height: 30,
            ),
            label: 'ME',
          ),
        ],
      ),
    );
  }
}
