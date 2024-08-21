import 'dart:convert';

import 'package:eat_print/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Add this import statement

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> extractHashtags(String content) {
  List<String> hashtags = [];
  RegExp exp = RegExp(r"\B#[\w가-힣]+");
  exp.allMatches(content).forEach((match) {
    final hashtag = match.group(0);
    if (hashtag != null) {
      hashtags.add(hashtag);
    }
  });
  return hashtags;
}

Future<int> uploadPost(
    List<XFile> images, String content, latitude, longitude) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int userNum = prefs.getInt('user_num') ?? -1;
  List<String> imageUrls =
      await uploadImages(images); //upload images and return imageUrls
  List<String> hashtags =
      extractHashtags(content); //extract hashtags from content
  final http.Response response;
  try {
    response = await http.post(
      Uri.parse('$baseURL/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'user_num': userNum,
        'imageUrls': imageUrls,
        'content': content,
        'location': {
          'latitude': latitude,
          'longitude': longitude,
        },
        'hashtags': hashtags,
      }),
    );
  } catch (e) {
    return 500;
  }
  return response.statusCode;
}

Future<List<String>> uploadImages(List<XFile> images) async {
  //upload image in parallel
  List<Future<String>> uploadFutures =
      images.map((image) => _uploadImage(image)).toList();

  List<String> imageUrls = await Future.wait(uploadFutures);
  return imageUrls;
}

Future<String> _uploadImage(XFile imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseURL/upload'),
  );

  request.files.add(
    http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(),
      await imageFile.length(),
      filename: imageFile.name,
      contentType: MediaType('image', 'jpeg'),
    ),
  );

  // 요청 전송
  var response = await request.send();

  if (response.statusCode == 201) {
    var responseData = await http.Response.fromStream(response);
    return responseData.body;
  } else {
    return response.statusCode.toString();
  }
}
