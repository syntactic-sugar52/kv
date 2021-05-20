import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/landing_page/landing_services.dart';
import 'package:kv/utils/media_utility.dart';
import 'package:provider/provider.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  File userAvatar;
  File get getUserAvatar => userAvatar;
  String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;
  bool isPicked = false;

//todo : fix storage rules
  Future pickUserAvatar(BuildContext context, ImageSource imageSource) async {
    PickedFile pickUserAvatar = await picker.getImage(
      source: imageSource,
      imageQuality: 85,
    );
    if (userAvatar != null) {
      userAvatar = File(pickUserAvatar.path);
      // print(userAvatar.path);
      // print(userAvatar);
      return photoBox(userAvatar, 100.0, 100.0, context);
    }

    notifyListeners();
  }

  Widget photoBox(
      File file, double width, double height, BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: file == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(file),
              ),
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Color(0xff64dfdf)),
      ),
      child: file == null
          ? Icon(
              Icons.add,
              color: Color(0Xff64dfdf),
              size: 15,
            )
          : null,
    );
  }

  Future _pickFile(ImageSource source, BuildContext context) async {
    final pickedImage = await picker.getImage(source: source);
    userAvatar = File(pickedImage.path);

    if (pickedImage != null) {
      print('userAvatar => $userAvatar');
      print('userAvatarUrl => $userAvatarUrl');
      return File(userAvatar.path);
    }
    Provider.of<LandingService>(context, listen: false).showUserAvatar(context);

    notifyListeners();
  }

  Future showMediaDialog(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Upload Picture"),
          children: [
            SimpleDialogOption(
              child: Text("Camera"),
              onPressed: () {
                var file = _pickFile(ImageSource.camera, context);

                Navigator.pop(context, file);
                // pickUserAvatar(context, ImageSource.camera).whenComplete(() {
                //   Navigator.pop(context);
                //   buildPhotoBox(context);

                // });
              },
            ),
            SimpleDialogOption(
              child: Text("Gallery"),
              onPressed: () {
                // pickUserAvatar(context, ImageSource.gallery).whenComplete(() {
                //   Navigator.pop(context);
                //   buildPhotoBox(context);
                // Provider.of<LandingService>(context, listen: false)
                //     .showUserAvatar(context);
                // });
                var file = _pickFile(ImageSource.gallery, context);

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
