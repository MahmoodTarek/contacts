import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<File?> pickImage() async {
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
   return File(image.path);
  }
  return null;
}