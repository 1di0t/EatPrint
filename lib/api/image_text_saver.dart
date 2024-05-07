import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final ImagePicker imagePicker = ImagePicker();

Future<void> saveImageAndText(String texts, XFile image) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;

  final bytes = await image.readAsBytes();
  final base64Image = base64Encode(bytes);

  final date = DateTime.now().toString();
  final data = {
    'texts': texts,
    'image': base64Image,
    'date': date,
  };

  final jsonString = jsonEncode(data);
  final file = File('$path/$date.json');
  await file.writeAsString(jsonString);
}
