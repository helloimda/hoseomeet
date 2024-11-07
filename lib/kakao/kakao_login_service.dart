// lib/kakao/kakao_login_service.dart
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoLoginService {
  Future<bool> login() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk(); // 카카오톡 앱으로 로그인
      } else {
        await UserApi.instance.loginWithKakaoAccount(); // 카카오 웹뷰로 로그인
      }
      return true; // 로그인 성공
    } catch (error) {
      print("Kakao 로그인 실패: $error");
      return false; // 로그인 실패
    }
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      print("Kakao 로그아웃 성공");
    } catch (error) {
      print("Kakao 로그아웃 실패: $error");
    }
  }
}
