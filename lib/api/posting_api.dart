import 'package:eat_print/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Add this import statement

import 'package:image_picker/image_picker.dart';

Future<void> uploadImages(List<XFile> images) async {
  for (var image in images) {
    await _uploadImage(image);
  }
}

Future<void> _uploadImage(XFile imageFile) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('$baseURL/upload'),
  );

  // XFile에서 파일 스트림을 가져와 MultipartFile 생성
  request.files.add(
    http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(), // 파일을 바이트 스트림으로 읽기
      await imageFile.length(), // 파일 크기를 가져옴
      filename: imageFile.name, // 파일 이름 설정
      contentType: MediaType('image', 'jpeg'), // MIME 타입 설정
    ),
  );

  // 요청 전송
  var response = await request.send();

  if (response.statusCode == 201) {
    var responseData = await http.Response.fromStream(response);
    print('Image URL: ${responseData.body}');
  } else {
    print('Failed to upload image. Status code: ${response.statusCode}');
  }
}

// Future<void> postingPost() async {
//   final response = await http.post(
//     Uri.parse('$baseURL/posting'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8'
//     },
//     body: jsonEncode(<String, String>{}),
//   );
// }
