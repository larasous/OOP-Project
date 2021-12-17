import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';

class LinkWidget extends StatelessWidget {
  final Function() onTap;
  final String text;

  const LinkWidget({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.signSubSubTitle,
        ),
      ),
    );
  }
}
