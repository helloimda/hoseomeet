import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config.dart'; // AppConfig import
import '../login/login_service.dart'; // AuthService import

class MessageReadService {
  final String readMessageEndpoint = '${AppConfig.baseUrl}/messages/flags/stream';
  final AuthService _authService;

  MessageReadService(this._authService);

  Future<void> markMessagesAsRead({
    required int streamId,
    int numBefore = 0,
    int numAfter = 0,
  }) async {
    // 저장된 토큰을 가져옵니다.
    String? token = _authService.accessToken;

    if (token == null) {
      throw Exception('로그인 토큰이 없습니다. 로그인이 필요합니다.');
    }

    // 요청 헤더 설정 (Bearer 토큰 추가)
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Bearer 토큰 추가
    };

    // 요청 바디 설정
    final body = jsonEncode({
      "anchor": "first_unread",
      "stream_id": streamId,
      "num_before": numBefore,
      "num_after": numAfter
    });

    // 요청 전송 콘솔 출력
    print('POST 요청을 보냅니다:');
    print('Endpoint: $readMessageEndpoint');
    print('Headers: $headers');
    print('Body: $body');

    // POST 요청 보내기
    final response = await http.post(
      Uri.parse(readMessageEndpoint),
      headers: headers,
      body: body,
    );

    // 응답에 따라 로그 출력
    if (response.statusCode == 200) {
      print('메시지 읽음 처리 성공');
      print('응답 데이터: ${response.body}');
    } else {
      print('메시지 읽음 처리에 실패했습니다: ${response.statusCode}');
      print('응답 데이터: ${response.body}');
    }
  }
}
