import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/models/product.dart';
import 'package:kv/models/user.dart';
import 'package:kv/screens/upload/upload_helpers.dart';
import 'package:kv/screens/upload/upload_service.dart';
import 'package:kv/services/auth.dart';
import 'package:kv/services/database.dart';
import 'package:kv/services/db_future.dart';
import 'package:kv/services/firebase_api.dart';
import 'package:kv/utils/upload_post.dart';
import 'package:kv/widgets/button_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class UploadScreen extends StatefulWidget {
  static BuildContext appContext;

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  UserModel _currentUser;
  Auth _user;
  UploadPost _post;
  UploadService _uploadService;
  UploadHelpers _uploadHelpers;
  bool _isButtonDisabled;
  final Uuid _uuid = Uuid();
  @override
  void initState() {
    _isButtonDisabled = true;
  }

  final GlobalKey<ScaffoldState> _uploadKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    this._currentUser = Provider.of<UserModel>(context, listen: false);
    this._user = Provider.of<Auth>(context, listen: false);
    this._post = Provider.of<UploadPost>(context, listen: false);
    this._uploadHelpers = Provider.of<UploadHelpers>(context, listen: false);
    this._uploadService = Provider.of<UploadService>(context, listen: false);
    final fileName = _post.uploadVideo != null ? "" : 'No File Selected';
    return Scaffold(
      key: _uploadKey,
      backgroundColor: kBlack,
      appBar: Provider.of<UploadHelpers>(context, listen: false).appar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Select Video',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              // SizedBox(height: 8),
              // Text(
              //   fileName,
              //   style: TextStyle(fontSize: 16, color: kWhite),
              // ),
              SizedBox(height: 8),
              _isButtonDisabled
                  ? Container()
                  : _uploadHelpers.buildFormField(context, (val) {
                      setState(() {
                        _uploadHelpers.selectedType = val;
                      });
                    }, (val) {
                      setState(() {
                        _uploadHelpers.categoryVal = val;
                      });
                    }),
              SizedBox(height: 48),
              _isButtonDisabled
                  ? Container()
                  : ButtonWidget(
                      text: 'Upload File',
                      icon: Icons.cloud_upload_outlined,
                      onClicked: uploadFile,
                    ),
              SizedBox(height: 10),
              _post.uploadTask != null
                  ? buildUploadStatus(_post.uploadTask)
                  : Container(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, allowCompression: true);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() {
      _post.uploadVideo = File(path);

      _isButtonDisabled = false;
    });
  }

  Product _product = Product();

  Future uploadFile() async {
    if (_post.uploadVideo == null) return;

    final fileName = _post.uploadVideo.path;
    var videoId = _uuid.v4();
    var productId = _uuid.v4();
    final destination = 'videoUrl/$videoId';

    _post.uploadTask = FirebaseApi.uploadFile(destination, _post.uploadVideo);
    setState(() {});

    if (_post.uploadTask == null) return;

    final snapshot = await _post.uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      _post.uploadVideo = File(urlDownload);
      _post.uploadVideoUrl = urlDownload;
    });
    final thumnail = await VideoThumbnail.thumbnailFile(
      video: _post.uploadVideoUrl,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight:
          64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 85,
    );

    switch (_uploadHelpers.selectedType) {
      case 'Product':
        var product = Product(
          title: _uploadHelpers.titleController.text.trim(),
          details: _uploadHelpers.detailsController.text.trim(),
          price: _uploadHelpers.priceController.text.trim(),
          cardType: _uploadHelpers.selectedType.trim(),
          category: _uploadHelpers.categoryVal.trim(),
          quantity: _uploadHelpers.quantityController.text.trim(),
          videoCreated: Timestamp.now(),
          videoId: videoId,
          videoUrl: _post.uploadVideoUrl,
          reviews: {},
          // productUid: doc.i,
          comments: {},
          views: 0,
          likes: 0,
          dislikes: 0,
          thumbnail: thumnail,
          userUid: _user.getCurrentUser.uid,
        );

        DBFuture().createProduct(product, productId);
        setState(() {
          _uploadHelpers.titleController.clear();
          _uploadHelpers.detailsController.clear();
          _uploadHelpers.priceController.clear();
          _uploadHelpers.quantityController.clear();
          _uploadHelpers.selectedType = null;
          _uploadHelpers.categoryVal = null;
          videoId = null;
          productId = null;
          print('upload video url => ${_post.uploadVideoUrl}');
          print('upload video  => ${_post.uploadVideo}');
        });
        Navigator.pop(context);
        break;
      case 'Service':
        print('service chosen');
        break;
      default:
        return print('choose again --  error');
        break;
    }

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
            );
          } else {
            return Container();
          }
        },
      );
}
