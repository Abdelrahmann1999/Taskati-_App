import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/mainbutton.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class uploadScreen extends StatefulWidget {
  const uploadScreen({super.key});

  @override
  State<uploadScreen> createState() => _uploadScreenState();
}

class _uploadScreenState extends State<uploadScreen> {
  String? path;
  var NameCotroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && NameCotroller.text.isNotEmpty) {
                LocalStorage.cacheData(LocalStorage.name, NameCotroller.text);
                LocalStorage.cacheData(LocalStorage.image, path!);
                pushTo(context, homeScreen());
              } else if (path == null && NameCotroller.text.isNotEmpty) {
                showmaindialog(context, "please select an image !");
              } else if (path != null && NameCotroller.text.isEmpty) {
                showmaindialog(context, "please enter your name !");
              } else {
                showmaindialog(
                  context,
                  "please select an image and enter your name !",
                );
              }
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showUploadBottomSheet(context);
                },
                child: Stack(
                  children: [
                    path != null
                        ? ClipOval(
                          child: Image.file(
                            File(path!),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                        : CircleAvatar(
                          radius: 70,

                          backgroundImage: AssetImage(
                            "assets/images/avatar.jpeg",
                          ),
                        ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              TextFormField(
                controller: NameCotroller,
                decoration: InputDecoration(hintText: "Enter your name"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                mainbutton(
                  title: "Upload From Camera",
                  onpreesed: () {
                    UploadImage(true);
                  },
                ),
                SizedBox(height: 7),
                mainbutton(
                  title: "Upload From Gallery",
                  onpreesed: () {
                    UploadImage(false);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  UploadImage(bool IsCamera) async {
    var imagePicker = ImagePicker();
    var PickedImage = await imagePicker.pickImage(
      source: IsCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (PickedImage != null) {
      setState(() {
        path = PickedImage.path;
      });
    }
    Navigator.pop(context);
  }
}
