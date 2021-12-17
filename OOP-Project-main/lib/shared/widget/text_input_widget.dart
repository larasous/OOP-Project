import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:petservice_oop_app/core/core.dart';

class TextInputWidget extends StatefulWidget {
  final String hintText;
  final String Function(String) validator;
  final MaskTextInputFormatter mask;
  final TextInputType inputType;
  final bool isPassword;
  TextEditingController textEditingController = TextEditingController();

  TextInputWidget({
    Key key,
    this.hintText,
    // ignore: avoid_init_to_null
    this.validator = null,
    // ignore: avoid_init_to_null
    this.mask = null,
    this.inputType,
    this.isPassword = false,
    this.textEditingController,
  }) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return widget.isPassword
        ? Container(
            height: 40,
            child: new TextFormField(
              controller: widget.textEditingController,
              textInputAction: TextInputAction.next,
              keyboardType: widget.inputType,
              inputFormatters: widget.mask == null ? [] : [widget.mask],
              maxLines: 1,
              decoration: new InputDecoration(
                fillColor: AppColors.white,
                hintText: widget.hintText,
                counterText: '',
                hintStyle: AppTextStyles.textInputBox,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.purple),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.purple,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              validator: widget.validator,
              obscureText: !_passwordVisible,
            ),
          )
        : Container(
            height: 40,
            child: new TextFormField(
              controller: widget.textEditingController,
              textInputAction: TextInputAction.next,
              keyboardType: widget.inputType,
              inputFormatters: widget.mask == null ? [] : [widget.mask],
              maxLines: 1,
              decoration: new InputDecoration(
                fillColor: AppColors.white,
                hintText: widget.hintText,
                counterText: '',
                hintStyle: AppTextStyles.textInputBox,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.purple),
                ),
              ),
              validator: widget.validator,
            ),
          );
  }
}
