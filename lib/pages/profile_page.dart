import 'package:flutter/material.dart';
import '../../api/login/login_service.dart'; // AuthService import

class ProfilePage extends StatelessWidget {
  final AuthService authService = AuthService();  // 싱글톤으로 AuthService 사용

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile Page'),
          ElevatedButton(
            onPressed: () {
              // 현재 저장된 토큰을 출력
              final token = authService.accessToken;
              if (token != null) {
                print('현재 토큰: $token');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('현재 토큰: $token')),
                );
              } else {
                print('저장된 토큰이 없습니다.');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('저장된 토큰이 없습니다.')),
                );
              }
            },
            child: Text('Button 1 - 토큰 출력'),
          ),
        ],
      ),
    );
  }
}
