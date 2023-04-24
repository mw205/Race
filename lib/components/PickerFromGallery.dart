// ignore_for_file: use_build_context_synchronously, must_be_immutable, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/upload image.dart';
//import 'package:xray_report/service/upload%20image.dart'

class PickerFromGallery extends StatelessWidget {
  ImagePicker picker = ImagePicker();
  late File photoFile;

  PickerFromGallery({super.key});

  //File get photo {return photoFile;}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () async {
              XFile? photo;
              photo = await picker.pickImage(source: ImageSource.gallery);
              photoFile = File((photo!.path));

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Chosen photo'),
                    content: Image.file(photoFile),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              width: 250,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 200,
                    ),
                  ),
                  Text(
                    "Add a photo from your gallery",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(103, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: SizedBox(
            height: 40,
            width: 111,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7981FA), // Background color
              ),
              onPressed: () {
                File photo = photoFile;
                upload_Image('file', photo);
                _launchInBrowser(Uri.parse(
                    'http://ec2-18-134-136-249.eu-west-2.compute.amazonaws.com:5000/static/output.png'));
              },
              child: Row(
                children: const [
                  Icon(Icons.upload),
                  Text("Upload"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
