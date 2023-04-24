// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../components/FloatingPickerFromCamera.dart';
import '../components/PickerFromGallery.dart';

class Race extends StatelessWidget {
  Race({super.key});

  String? fileName;

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    return Scaffold(
      appBar: NewGradientAppBar(
        centerTitle: true,
        title: const Text(
          "Race",
          style: TextStyle(fontFamily: "NeueMachina", fontSize: 25),
        ),
        gradient: const LinearGradient(
          colors: [Color(0xff01204C), Color(0xff2CA0E2)],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 25),
                  child: Row(
                    children: const [
                      Text(
                        "Classify\n\nsecondhand clothes \n \nwith Race.",
                        style: TextStyle(
                            fontFamily: "NeueMachina",
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              PickerFromGallery(),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/MMA dark blue .png",
                    width: 100,
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingCameraPicker(),
    );
  }
}
