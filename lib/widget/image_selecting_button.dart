import 'dart:io';

import 'package:eat_print/api/select_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectingButton extends StatefulWidget {
  const ImageSelectingButton({super.key});

  @override
  State<ImageSelectingButton> createState() => _ImageSelectingButtonState();
}

class _ImageSelectingButtonState extends State<ImageSelectingButton> {
  File? image;
  File? getImage() => image;
  final ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ImageSelector().selectImage,
      child: const Text('Select Image'),
    );
  }
}
