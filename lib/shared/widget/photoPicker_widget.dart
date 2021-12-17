import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:petservice_oop_app/core/core.dart';

class PhotoPickerWidget extends StatefulWidget {
  final double size;
  final ValueChanged<File> onfilePathChanged;
  final _picker = ImagePicker();
  File file;
  bool _isloadingPhoto = false;

  PhotoPickerWidget(
      {Key key, this.onfilePathChanged, this.size = 102, this.file})
      : super(key: key);

  @override
  _PhotoPickerWidgetState createState() => _PhotoPickerWidgetState();
}

class _PhotoPickerWidgetState extends State<PhotoPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          widget._isloadingPhoto = true;
        });

        final PickedFile pickedFile = await widget._picker
            .getImage(source: ImageSource.gallery)
            .then((pickedFile) {
          setState(() {
            try {
              widget.file = File(pickedFile.path);
              widget.onfilePathChanged.call(widget.file);
              widget._isloadingPhoto = false;
            } on NoSuchMethodError catch (e) {
              widget._isloadingPhoto = false;
            }
          });
        });
      },
      child: Container(
          width: widget.size,
          height: widget.size,
          child: widget._isloadingPhoto
              ? LoadingIndicator(
                  indicatorType: widget.file != null
                      ? Indicator.ballScaleMultiple
                      : Indicator.ballScale,
                  color: widget.file != null
                      ? AppColors.lightPurple
                      : AppColors.purple,
                )
              : widget.file == null
                  ? Icon(Icons.camera_alt, color: AppColors.purple)
                  : null,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.grayShadow,
                  offset: Offset(0, 8),
                  blurRadius: 23)
            ],
            image: widget.file != null
                ? DecorationImage(
                    image: FileImage(widget.file), fit: BoxFit.cover)
                : null,
            color: AppColors.lightPurple,
            borderRadius: BorderRadius.all(Radius.elliptical(102, 102)),
          )),
    );
  }
}
