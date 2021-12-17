import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/HomePetSitter/widgets/app_bar/appBar.dart';
import 'package:petservice_oop_app/screens/HomePetSitter/widgets/card/card.dart';
import 'package:petservice_oop_app/screens/HomePetSitter/widgets/toogle/toogle.dart';
import 'package:petservice_oop_app/shared/widget/bottomNavigatorBar.dart';

class HomePetSitter extends StatefulWidget {
  const HomePetSitter({Key key}) : super(key: key);

  @override
  _HomePetSitterState createState() => _HomePetSitterState();
}

class _HomePetSitterState extends State<HomePetSitter> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int _selectedIndex = 0;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(151), child: AppBarHome()),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              SizedBox(
                height: 54,
              ),
              ToggleWidget(),
              SizedBox(
                height: 30,
              ),
              CardWidget(),
            ]
          )
        )
      ),
      bottomNavigationBar: BottomNavigationBarHome(selectedIndex: 0)
    );
  }
}
