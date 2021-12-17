import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import 'package:petservice_oop_app/shared/widget/toggleButton_widget.dart';

class AppBarCustomerScheduled extends StatefulWidget {
  const AppBarCustomerScheduled({Key key}) : super(key: key);

  @override
  _AppBarCustomerScheduledState createState() =>
      _AppBarCustomerScheduledState();
}

class _AppBarCustomerScheduledState extends State<AppBarCustomerScheduled> {
  TextEditingController pesquisa_controller = TextEditingController();
  List<Map<String, bool>> itens = [
    {"Data": false},
    {"Status": false}
  ];
  @override
  void initState() {
    super.initState();
    pesquisa_controller.addListener(() {
      print('Texto aqui');
    });
  }

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
              "Que tal marcar um serviço?",
              style: AppTextStyles.homeTitle,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ToggleButtonWidget(
            color: AppColors.purple,
            font: AppTextStyles.tagBox,
            fontSelected: AppTextStyles.tagBoxSelected,
            items: itens,
          ),
          TextInputWidget(
            textEditingController: pesquisa_controller,
          ),
        ],
      ),
    );
  }
}
