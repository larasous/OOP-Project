import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/CustomerSchedule/customer_schedule_page.dart';
import 'package:petservice_oop_app/screens/HomeClient/widgets/agenda/agenda.dart';
import 'package:petservice_oop_app/shared/model/day.dart';
import 'package:petservice_oop_app/shared/model/pet.dart';
import 'package:petservice_oop_app/shared/widget/bottomNavigatorBar.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/agenda/agenda_controller.dart';
import 'widgets/app_bar/appBar.dart';
import 'widgets/pet_profile/pet_profile.dart';
import 'widgets/toggle/toggle.dart';

class HomeClientPage extends StatefulWidget {
  Scheduled scheduled = Scheduled();
  HomeClientPage({Key key}) : super(key: key);

  @override
  _HomeClientPageState createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  @override
  Widget build(BuildContext context) {
    List<Pet> pets;
    int _selectedIndex = 0;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(151), child: AppBarHome()),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 54,
              ),
              Text(
                "R\$ 50.00",
                style: AppTextStyles.clientHomeMoney,
              ),
              SizedBox(
                height: 43,
              ),
              PetProfile(
                pets: pets,
                onPetsSelectedChanged: (p) {
                  widget.scheduled.pets = p;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ToggleWidget(
                onVimPegarChanged: (vp) {
                  widget.scheduled.isVimPegar = vp;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ChangeNotifierProvider<AgendaController>(
                  create: (context) => AgendaController(),
                  child: AgendaWidget(
                    onIntervalChanged: (intv) {
                      widget.scheduled.interval = intv;
                    },
                  )),
              Container(
                width: double.infinity - 62,
                decoration: BoxDecoration(color: AppColors.white),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 14, bottom: 14, left: 31, right: 31),
                  child: ButtonWidget(
                      onCLick: () {
                        print("isVimPegar = ${widget.scheduled.isVimPegar}");
                        widget.scheduled.pets.forEach((p) {
                          print(p.name);
                        });

                        print(DateFormat('dd-MM-yyyy HH:mm')
                            .format(
                                widget.scheduled.interval?.start?.dateTime ??
                                    DateTime(0))
                            .toString());
                        print(DateFormat('dd-MM-yyyy HH:mm')
                            .format(widget.scheduled.interval?.end?.dateTime ??
                                DateTime(0))
                            .toString());
                      },

                      text: "Marcar Serviço",
                      textStyle: AppTextStyles.buttonLarge,
                      color: AppColors.blueGray),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarHome(selectedIndex: 0),
    );
  }
}
