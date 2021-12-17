import 'package:flutter/material.dart';
import '../../core/core.dart';

class Agenda2 extends StatefulWidget {
  @override
  _Agenda2State createState() => _Agenda2State();
}

class _Agenda2State extends State<Agenda2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.backgroundColor,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30,
                                height: 22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border:
                                        Border.all(color: AppColors.purple)),
                                child: Icon(
                                  Icons.dehaze_sharp,
                                  color: AppColors.black,
                                  size: 17.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Olá, Karen",
                            style: AppTextStyles.homeSubTitle,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Confira sua agenda",
                            style: AppTextStyles.homeTitle,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 320,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 19, right: 21),
                            child: Center(
                              child: Text(
                                "Pesquisa",
                                style: AppTextStyles.signDescription,
                              ),
                            ),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text("Ordenar por")),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text("Abril")),
                            SizedBox(
                              width: 250,
                            ),
                            Expanded(child: Text("2021")),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: 319,
                          height: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 21, left: 20),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.darkGray,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: 321.66,
                          height: 65,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 18, left: 20.34),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7),
                            ),
                            border: Border.all(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 321.66,
                          height: 24,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 18, left: 20.34),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            ),
                            border: Border.all(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 266,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
