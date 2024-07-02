import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector with ChangeNotifier {
  File? image;
  File? getImage() => image;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> selectImage() async {
    try {
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        image = File(selectedImage.path);
        notifyListeners();
      }
    } catch (e) {
      print("이미지 선택 오류");
      
    }
  }
}
