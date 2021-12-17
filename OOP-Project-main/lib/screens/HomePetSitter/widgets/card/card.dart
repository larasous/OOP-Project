import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/model/card.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  
  List<Cards> cards = [
    Cards(
      image: 'https://avatars.githubusercontent.com/u/35410277?v=4',
      name: 'João Victor',
      text: 'Estudante de Engenharia de Computação, dono de 2 cachorros',
      date1: '21/4 - Qui - 9:00',
      date2: '21/4 - Qui - 13:00',
      data: true,
      vimPegar: true,
      irDeixar: false
    ),
    Cards(
      image: 'https://avatars.githubusercontent.com/u/35410277?v=4',
      name: 'João',
      text: 'Estudante de Engenharia de Computação, dono de 1 gato',
      date1: '09/7 - Sex - 10:00',
      date2: '09/7 - Sex - 14:00',
      data: true,
      vimPegar: false,
      irDeixar: true
    )
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                margin: EdgeInsets.only(top: 350),
                padding: EdgeInsets.only(bottom: 15),
                width: size.width * 0.90,
                height: size.height * 0.20,
                child: Card(
                    margin: EdgeInsets.only(left: 12, right: 10),
                    elevation: 20,
                    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ListTile(
                        leading: Image.asset(AppImage.profile),
                        title: Text('João Victor'),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                              'Estudante de Engenharia de Computação, dono de 2 cachorros'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                verticalDirection: VerticalDirection.down,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.10,
                                    height: size.height * 0.10,
                                    child: Icon(
                                      Icons.car_rental_outlined,
                                      color: AppColors.purple,
                                      size: 20,
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: SizedBox(
                              width: size.width * 0.28,
                              height: size.height * 0.025,
                              child: ButtonWidget(
                                text: '21/4 - Qui - 9:00',
                                color: AppColors.purple,
                                textStyle: AppTextStyles.buttonLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              width: size.width * 0.28,
                              height: size.height * 0.024,
                              child: ButtonWidget(
                                text: '21/4 - Qui - 13:00',
                                color: AppColors.orange,
                                textStyle: AppTextStyles.buttonLarge,
                              ),
                            ),
                          )
                        ],
                      )
                    ])),
                    
              ),
            ),
           Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Container(
                margin: EdgeInsets.only(top: 350),
                padding: EdgeInsets.only(bottom: 15),
                width: size.width * 0.90,
                height: size.height * 0.20,
                child: Card(
                    margin: EdgeInsets.only(left: 12, right: 10),
                    elevation: 20,
                    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ListTile(
                        leading: Image.asset(AppImage.cancelationPicture),
                        title: Text('Bruna'),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                              'Estudante de Medicina Veterinária, dona de 1 gato e 1 cachorro'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                                verticalDirection: VerticalDirection.down,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.10,
                                    height: size.height * 0.10,
                                    child: Icon(
                                      Icons.car_rental_outlined,
                                      color: AppColors.purple,
                                      size: 20,
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: SizedBox(
                              width: size.width * 0.28,
                              height: size.height * 0.025,
                              child: ButtonWidget(
                                text: '09/7 - Sex - 10:00',
                                color: AppColors.purple,
                                textStyle: AppTextStyles.buttonLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              width: size.width * 0.28,
                              height: size.height * 0.024,
                              child: ButtonWidget(
                                text: '09/7 - Sex - 14:00',
                                color: AppColors.orange,
                                textStyle: AppTextStyles.buttonLarge,
                              ),
                            ),
                          )
                        ],
                      )
                    ])),   
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
