// lib/pages/chat_detail_page.dart

import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final Map<String, dynamic> chatRoom;

  const ChatDetailPage({Key? key, required this.chatRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatRoom['title']),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 임의의 채팅 메시지 수
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/img/profile-placeholder.png'),
                  ),
                  title: Text('User${index + 1}'),
                  subtitle: Text('메시지 내용 ${index + 1}'),
                  trailing: Text('오전 10:53'),
                );
              },
            ),
          ),
          // 메시지 입력창
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '메시지 입력...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: () {
                    // 메시지 전송 로직 추가
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
