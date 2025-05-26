import 'dart:async';
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class CustomeImagesUploadField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool showLabel;

  final Function(File image, String filename, String base64)? onImagePicked;

  const CustomeImagesUploadField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.onImagePicked,
  this.showLabel=true
  });

  @override
  State<CustomeImagesUploadField> createState() =>
      _ImagesUploadFieldState();
}

class _ImagesUploadFieldState extends State<CustomeImagesUploadField> {
  File? _imageFile;
  String? _fileName;
  final _picker = ImagePicker();

  int imageWidth = 200;
  int imageHeight = 200;

  var pickedFile;
  String pickedFileName = '';
  String img64String = "";
  //File imageFile = File('');
  bool _loadPickedFile = false;

  void calculateImageSize(String path) {
    Image image = Image.file(File(path));
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo image, bool _) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());

        double ratio = size.height > size.width
            ? (size.height / 1024)
            : (size.width / 1024);

        setState(() {
          imageHeight = (size.height / ratio).toInt();
          imageWidth = (size.width / ratio).toInt();
        });
      }),
    );
  }

  void pickImageCamera() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      String? mimeType = lookupMimeType(pickedFile.path);

      if (mimeType == 'image/jpeg') {
        _loadPickedFile = true;
        calculateImageSize(pickedFile.path);
        _cropImage(File(pickedFile.path));
      } else {
        setState(() {
          // invalid file type
        });
      }
    }
  }

  void pickImageGallery() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      String? mimeType = lookupMimeType(pickedFile.path);


        _loadPickedFile = true;
        calculateImageSize(pickedFile.path);
        _cropImage(File(pickedFile.path));

    }
  }

  void clearImage() {
    setState(() {
      _loadPickedFile = false;
      img64String = '';
      _imageFile = null; // Clear the image
      _fileName = null;
    });
  }

  Future<void> _cropImage(File picture) async {
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: picture.path,
      compressQuality: 100,
      maxWidth: 1080,
      maxHeight: 1080,
    );

    if (cropped != null) {
      final File croppedFile = File(cropped.path);
      final bytes = croppedFile.readAsBytesSync().lengthInBytes;

      final kb = bytes / 1024;
      final mb = kb / 1024;

      if (mb > 2) {

        showToast(
            AppLocalizations.of(context)!
            .translate('imageSizeLarge'),
            context: context,
            animation: StyledToastAnimation.scale,
            fullWidth: true);

        setState(() {
          _loadPickedFile = false;
          pickedFile = null;
        });
      } else {
        final base64Image = croppedFile.readAsBytesSync();
        img64String = "data:image/jpg;base64," + base64Encode(base64Image);

        setState(() {
          _imageFile = croppedFile;
          _fileName = path.basename(croppedFile.path);
        });

        if (widget.onImagePicked != null) {
          widget.onImagePicked!(
              croppedFile, path.basename(croppedFile.path), img64String);
        }
      }
    } else {
      setState(() {
        _loadPickedFile = false;
        pickedFile = null;
      });
    }
  }

  Future<void> _pickImage() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title:  Text(AppLocalizations.of(context)!
                    .translate('takePhoto'),),
                onTap: () async {
                  Navigator.pop(context);
                  pickImageCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title:  Text(AppLocalizations.of(context)!
                    .translate('chooseFromGellary'),),
                onTap: () async {
                  Navigator.pop(context);
                  pickImageGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       widget.showLabel? Label(text: widget.labelText,):Container(),
        const SizedBox(height: 8),
        DottedBorder(
          color: AppTheme.lightAppColors.bordercolor,
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: [6, 3],
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _fileName ?? widget.hintText,
                    style: TextStyle(
                      fontSize: 16,
                      color: _fileName != null
                          ? AppTheme.lightAppColors.mainTextcolor
                          : AppTheme.lightAppColors.mainTextcolor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: _pickImage,
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.lightAppColors.primary,
                    side: BorderSide(
                      color: AppTheme.lightAppColors.primary,
                      width: 1.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    _fileName != null
                        ? AppLocalizations.of(context)!
                        .translate('changefile')
                        : AppLocalizations.of(context)!
                        .translate('selectFile'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_imageFile != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0), // match DottedBorder padding
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _imageFile!,
                    height: 200,
                    width: MediaQuery.of(context).size.width - 32, // Set width same as DottedBorder
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8, // Adjust the position from the top
                  left: 8, // Adjust the position from the left
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white, // You can change the icon color here
                    ),
                    onPressed: () {
                      clearImage();
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
