import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kv/constants/colors.dart';
import 'package:provider/provider.dart';

class UploadPost with ChangeNotifier {
  final _picker = ImagePicker();
  File uploadVideo;
  File get getUploadVideo => uploadVideo;
  UploadTask uploadTask;
  String uploadVideoUrl;
  String get getUploadVideoUrl => uploadVideoUrl;

  Future pickUserAvatar(BuildContext context, ImageSource imageSource) async {
    PickedFile uploadPostValue = await _picker.getVideo(
        source: imageSource, maxDuration: Duration(seconds: 40));
    if (uploadVideo != null) {
      uploadVideo = File(uploadVideo.path);

      // return photoBox(userAvatar, 100.0, 100.0, context);
    }

    notifyListeners();
  }

  Future<File> _pickFile(ImageSource source) async {
    final pickedImage = await _picker.getVideo(source: source);
    if (pickedImage != null) {
      // uploadVideo = File(pickedImage.path);
      return File(pickedImage.path);
    }
    notifyListeners();
    return null;
  }

  Future<File> showMediaDialog(BuildContext parentContext) async {
    return await showDialog<File>(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Upload Post"),
          children: [
            SimpleDialogOption(
              child: Text("Camera"),
              onPressed: () async {
                var file = await _pickFile(ImageSource.camera);

                Navigator.pop(context, file);
              },
            ),
            SimpleDialogOption(
              child: Text("Gallery"),
              onPressed: () async {
                var file = await _pickFile(ImageSource.camera);

                Navigator.pop(context, file);
              },
            ),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context, null),
            )
          ],
        );
      },
    );
  }
}
