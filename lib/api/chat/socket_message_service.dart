import 'dart:async';
import 'dart:convert';
import 'dart:io';

class SocketMessageService {
  final String socketUrl = 'ws://127.0.0.1:8000/api/v1/events/connect';
  final String _token;

  WebSocket? _socket;
  StreamController<Map<String, dynamic>> _messageStreamController = StreamController.broadcast();
  late Stream<Map<String, dynamic>> messageStream;

  SocketMessageService(this._token) {
    messageStream = _messageStreamController.stream;
  }

  Future<void> connectWebSocket() async {
    try {
      _socket = await WebSocket.connect(
        socketUrl,
        headers: {
          'sec-websocket-protocol': _token,
        },
      );
      print('WebSocket 연결 성공');
      _socket!.listen(
        _onMessageReceived,
        onDone: _onSocketDone,
        onError: _onSocketError,
      );
    } catch (error) {
      print('WebSocket 연결 실패: $error');
    }
  }

  void _onMessageReceived(dynamic data) {
    try {
      final decodedData = jsonDecode(data);
      print('수신한 메시지: $decodedData');

      if (decodedData['data'] != null && decodedData['data']['type'] == 'stream') {
        _messageStreamController.add(decodedData['data']['data']);
      }
    } catch (error) {
      print('메시지 처리 중 오류 발생: $error');
    }
  }

  void _onSocketDone() {
    print('WebSocket 연결이 종료되었습니다.');
  }

  void _onSocketError(error) {
    print('WebSocket 오류 발생: $error');
  }

  // WebSocket 연결 종료 함수
  void closeWebSocket() {
    _socket?.close();
    _socket = null;
    print('WebSocket 연결을 종료했습니다.');
  }

  // 스트림 종료 함수
  void dispose() {
    _messageStreamController.close();
  }
}
