import 'dart:convert';
import 'dart:io';

Future<String> encodeImage(File image) async {
  final bytes = await image
      .readAsBytes(); //Read imageFile as bytes and save in bytes variable
  return base64Encode(bytes); //Encode bytes to base64 and return
}
