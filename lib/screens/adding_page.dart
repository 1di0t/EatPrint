import 'dart:io';

import 'package:eat_print/api/posting_api.dart';
import 'package:eat_print/widget/app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:image_picker/image_picker.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final List<XFile> _images = [];
  final ImagePicker picker = ImagePicker();
  final TextEditingController contentController = TextEditingController();

  Future<void> _pickImage() async {
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final List<XFile> pickedImages = await picker.pickMultiImage(limit: 5);
    if (pickedImages.isNotEmpty) {
      _images.clear();
      _images.addAll(pickedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          //picture
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 400,
            child: Expanded(
                child: GestureDetector(
              onTap: _pickImage,
              child: _images.isEmpty
                  ? Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.grey[800],
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(_images[index].path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
            )),
          ),
          //contents
          TextField(
            controller: contentController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hintText: '\t내용을 입력해주세요',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            cursorColor: Colors.black,
            maxLines: 5,
          ),

          //location
          const SizedBox(height: 20),
          TextButton(
              onPressed: () =>
                  uploadPost(_images, contentController.text, 30, 20),
              child: const Text('저장')),
        ],
      ),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}
