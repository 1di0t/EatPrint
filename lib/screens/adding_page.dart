import 'dart:io';

import 'package:eat_print/widget/app_bar_widget.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          //top bar
          //picture
          Expanded(
            child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  alignment: Alignment.center,
                  child: _image == null
                      ? Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.grey[800],
                        )
                      : ClipRRect(
                          child: Image.file(
                            _image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                )),
          )
          //gallery
        ],
      ),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}
