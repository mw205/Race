// ignore_for_file: must_be_immutable, use_build_context_synchronously, file_names

import 'dart:io';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FloatingCameraPicker extends StatelessWidget {
  FloatingCameraPicker({super.key});
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff7981FA),
      onPressed: () async {
        XFile? photo;
        photo = await picker.pickImage(source: ImageSource.camera);
        // moveFile(File(photo!.path), "assets/imagesSaved");
        alert(
          context,
          title: const Text('Chosen photo'),
          content: Image.file(
            File((photo!.path)),
          ),
        );
      },
      hoverElevation: 50,
      highlightElevation: 50,
      tooltip: 'use camera for classifying',
      child: const Icon(Icons.camera_alt_outlined),
    );
  }
}
