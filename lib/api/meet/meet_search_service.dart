import 'dart:convert';
import 'package:http/http.dart' as http;

class MeetSearchService {
  final String baseUrl = 'http://www.campus-meet.shop/api/v1/meet_post/search';

  Future<List<Map<String, dynamic>>> fetchPosts({int skip = 0, int limit = 10}) async {
    final response = await http.get(
      Uri.parse('$baseUrl?skip=$skip&limit=$limit'),
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      // Map<String, dynamic>으로 캐스팅
      return data.map<Map<String, dynamic>>((post) {
        return {
          ...post as Map<String, dynamic>, // 명시적으로 Map<String, dynamic>으로 변환
          "join_people": post["current_people"] ?? null, // 없으면 null
        };
      }).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
