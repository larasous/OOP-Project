import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/SplashScreen/splashscreen_controller.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController controller = SplashScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 67),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: 245.0,
                          height: 245.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(AppImage.splashPicture)))),
                      Container(
                          width: 245.0,
                          height: 245.0,
                          decoration: new BoxDecoration(
                            gradient: AppGradient.purpleSplashScreen,
                            shape: BoxShape.circle,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32), //Imagens Tela de Splash
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 57, right: 57),
                    child: Text("Encontre os melhores pet sitters da cidade",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.splashTitle),
                  ),
                ),
              ),
              SizedBox(height: 37), //Texto Anunciativo 1 Negrito
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Container(
                  child: Center(
                    child: Text(
                      "Acesse vários cuidadores da área instantaneamente."
                      " Você facilmente pode contatá-los e agendar seus serviços !",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.splashDescription,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 97), //Texto Anunciativo 2
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: Container(
                    height: 40,
                    child: ButtonWidget(
                      text: "COMEÇAR A USAR",
                      textStyle: AppTextStyles.buttonSmall,
                      color: AppColors.purple,
                      onCLick: () {
                        controller.onClickLogin(context);
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
