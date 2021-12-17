import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';

class ToggleWidget extends StatefulWidget {
  ToggleWidget({Key key}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool data = false;
  bool vimPegar = false;
  bool irDeixar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Ordenar por',
              style: AppTextStyles.signSubSubTitle,
              textAlign: TextAlign.left,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                data = true;
                vimPegar = false;
                irDeixar = false;
              });
            },
            child: (data
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
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
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Data",
                      style: AppTextStyles.clientHomeToggleSelected,
                    )),
                  )
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Data",
                      style: AppTextStyles.clientHomeToggle,
                    )),
                  )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                data = false;
                vimPegar = true;
                irDeixar = false;
              });
            },
            child: vimPegar
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
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
                      color: AppColors.lightPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text("Vim pegar",
                            style: AppTextStyles.clientHomeToggleSelected)))
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Vim pegar",
                            style: AppTextStyles.clientHomeToggle))),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                data = false;
                vimPegar = false;
                irDeixar = true;
              });
            },
            child: irDeixar
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.purple,
                          width: 1,
                        ),
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Ir deixar",
                            style: AppTextStyles.clientHomeToggleSelected)))
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Ir deixar",
                            style: AppTextStyles.clientHomeToggle))),
          )
        ],
      ),
    );
  }
}
