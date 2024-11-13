import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'room_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _selectOptions = ['전체', '모임', '배달', '택시', '카풀'];
  String _selectedOption = '전체';
  bool _isDropdownOpened = false;

  bool _isSubCategoryVisible = false; // 자취방을 눌렀을 때 하위 카테고리 표시
  String _selectedSubCategory = '전체'; // 기본값으로 '전체' 카테고리 선택

  String _selectedMainCategory = '자취방'; // 기본값으로 자취방 선택

  final List<String> subCategories = ['전체', '정문', '중문', '후문', '기숙사']; // 하위 카테고리 리스트

  @override
  Widget build(BuildContext context) {
    final double panelHeightOpen = MediaQuery.of(context).size.height * 0.73;
    final double panelHeightClosed = MediaQuery.of(context).size.height * 0.15;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text('지도 API 백그라운드'),
          ),
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
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    children: [
                      _buildCategoryButton('자취방', _selectedMainCategory == '자취방' ? 'assets/img/icon/mainpage/roomtypered.png' : 'assets/img/icon/mainpage/roomtype.png', _toggleSubCategory, _selectedMainCategory == '자취방'),
                      _buildCategoryButton('음식점', _selectedMainCategory == '음식점' ? 'assets/img/icon/mainpage/foodtypered.png' : 'assets/img/icon/mainpage/foodtype.png', () => _selectMainCategory('음식점'), _selectedMainCategory == '음식점'),
                      _buildCategoryButton('카페', _selectedMainCategory == '카페' ? 'assets/img/icon/mainpage/cafetypered.png' : 'assets/img/icon/mainpage/cafetype.png', () => _selectMainCategory('카페'), _selectedMainCategory == '카페'),
                      _buildCategoryButton('술집', _selectedMainCategory == '술집' ? 'assets/img/icon/mainpage/bartypered.png' : 'assets/img/icon/mainpage/bartype.png', () => _selectMainCategory('술집'), _selectedMainCategory == '술집'),
                      _buildCategoryButton('편의점', _selectedMainCategory == '편의점' ? 'assets/img/icon/mainpage/shoptypered.png' : 'assets/img/icon/mainpage/shoptype.png', () => _selectMainCategory('편의점'), _selectedMainCategory == '편의점'),
                      _buildCategoryButton('놀거리', _selectedMainCategory == '놀거리' ? 'assets/img/icon/mainpage/playtypered.png' : 'assets/img/icon/mainpage/playtype.png', () => _selectMainCategory('놀거리'), _selectedMainCategory == '놀거리'),
                    ],
                  ),
                ),
                if (_isSubCategoryVisible)
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      children: subCategories.map<Widget>((category) {
                        return _buildCategoryButton(
                          category,
                          '',
                              () => _selectSubCategory(category),
                          _selectedSubCategory == category,
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
          SlidingUpPanel(
            minHeight: panelHeightClosed,
            maxHeight: panelHeightOpen,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            panel: _selectedMainCategory == '자취방' ? RoomList() : _buildPanelContent(),
            body: Stack(
              children: [
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.28,
                  left: 16,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        shape: CircleBorder(),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/img/icon/mainpage/heart.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        shape: CircleBorder(),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/img/icon/mainpage/gps.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String text, String iconPath, [VoidCallback? onPressed, bool isSelected = false]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.red : Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
          side: BorderSide(color: Colors.grey),
        ),
        child: Row(
          children: [
            if (iconPath.isNotEmpty)
              Image.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
            if (iconPath.isNotEmpty) SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _selectSubCategory(String category) {
    setState(() {
      _selectedSubCategory = category;
    });
  }

  void _selectMainCategory(String category) {
    setState(() {
      _selectedMainCategory = category;
      _isSubCategoryVisible = false;
    });
  }

  void _toggleSubCategory() {
    setState(() {
      _isSubCategoryVisible = !_isSubCategoryVisible;
      _selectedMainCategory = '자취방';
    });
  }

  Widget _buildPanelContent() {
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
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '지금 소소님을 기다리고 있어요!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: _isDropdownOpened
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]
                      : [],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: _selectedOption,
                    icon: SizedBox.shrink(),
                    items: _selectOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          width: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value),
                              Divider(color: Colors.grey),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                        _isDropdownOpened = false;
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isDropdownOpened = true;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return _selectOptions.map((String value) {
                        return Row(
                          children: [
                            Text(value),
                            Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          ],
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
