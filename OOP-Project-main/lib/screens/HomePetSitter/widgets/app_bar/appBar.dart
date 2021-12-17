import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';

class AppBarHome extends StatefulWidget {
  AppBarHome({Key key}) : super(key: key);

  @override
  _AppBarHomeState createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 21, left: 23, top: 23),
      width: 362,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: AppColors.purple)),
                  child: Icon(
                    Icons.dehaze_sharp,
                    color: AppColors.black,
                    size: 17.0,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.lightPurple,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/35410277?v=4'),
                ), 
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Olá, João",
              style: AppTextStyles.homeSubTitle,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Confira suas solicitações",
              style: AppTextStyles.homeTitle,
            ),
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
