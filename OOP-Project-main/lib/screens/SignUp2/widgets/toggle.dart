import 'package:flutter/material.dart';
import "package:petservice_oop_app/core/core.dart";

import '../sign_controller.dart';

class ToggleWidget extends StatefulWidget {
  final ValueChanged<bool> onClienteChanged;
  ToggleWidget({Key key, this.onClienteChanged}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isCliente = false;
  bool isPetsitter = false;
  var control = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
              color: AppColors.grayShadow, offset: Offset(0, 4), blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isCliente = true;
                isPetsitter = false;
                control.isCliente();
              });
            },
            child: (isCliente
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grayShadow,
                            offset: Offset(5, 0),
                            blurRadius: 13)
                      ],
                      border: Border.all(
                        color: AppColors.purple,
                        width: 1,
                      ),
                      color: AppColors.purple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Cliente",
                      style: AppTextStyles.clientHomeToggleSelected,
                    )),
                  )
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Cliente",
                      style: AppTextStyles.buttonSmall,
                    )),
                  )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCliente = false;
                isPetsitter = true;
                control.isPetsitter();
              });
            },
            child: !isCliente
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grayShadow,
                              offset: Offset(-5, 0),
                              blurRadius: 13)
                        ],
                        border: Border.all(
                          color: AppColors.purple,
                          width: 1,
                        ),
                        color: AppColors.purple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        )),
                    child: Center(
                        child: Text("PetSitter",
                            style: AppTextStyles.clientHomeToggleSelected)))
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        )),
                    child: Center(
                        child: Text("PetSitter",
                            style: AppTextStyles.buttonSmall))),
          )
        ],
      ),
    );
  }
}
