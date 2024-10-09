import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // DateFormat 사용을 위한 패키지
import '../../api/chat/load_message_service.dart'; // LoadMessageService import
import '../../api/login/login_service.dart'; // AuthService import

class ChatDetailPage extends StatefulWidget {
  final Map<String, dynamic> chatRoom;

  ChatDetailPage({required this.chatRoom});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late Future<List<dynamic>> _messagesFuture;
  late final LoadMessageService loadMessageService;

  @override
  void initState() {
    super.initState();
    final authService = AuthService(); // AuthService 인스턴스 생성
    loadMessageService = LoadMessageService(authService); // AuthService 전달

    // stream_id를 인자로 전달하여 메시지 불러오기
    _messagesFuture = loadMessageService.loadMessages(widget.chatRoom['stream_id']);
  }

  String _formatTime(String timestamp) {
    // 서버에서 받은 ISO 8601 타임스탬프를 DateTime 객체로 변환
    DateTime dateTime = DateTime.parse(timestamp);

    // 원하는 형식으로 포맷 (오전/오후 12:00)
    String formattedTime = DateFormat('a h:mm', 'ko_KR').format(dateTime);

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatRoom['name'] ?? 'No Title'), // 채팅방 이름
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.red, thickness: 1.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _messagesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // 로딩 중
                } else if (snapshot.hasError) {
                  return Center(child: Text('메시지를 불러오는데 실패했습니다.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('메시지가 없습니다.'));
                } else {
                  final messages = snapshot.data!;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      bool isMe = message['sender_id'] == 1; // 현재 사용자 ID와 비교 (1은 예시)

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment:
                          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            if (!isMe) ...[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.purple.shade200,
                              ),
                              SizedBox(width: 8),
                            ],
                            Column(
                              crossAxisAlignment:
                              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isMe
                                        ? Colors.pink.shade100
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  constraints: BoxConstraints(maxWidth: 200),
                                  child: Text(
                                    message['content'] ?? '',
                                    style: TextStyle(
                                      color: isMe ? Colors.black : Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  _formatTime(message['date_sent'] ?? 'Unknown'), // 타임스탬프 출력
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '메시지를 입력하세요...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
