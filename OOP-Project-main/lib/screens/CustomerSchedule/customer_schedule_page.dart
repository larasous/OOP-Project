import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/CustomerSchedule/widgets/app_bar/app_bar_customer_scheduled.dart';
import 'package:petservice_oop_app/screens/CustomerSchedule/widgets/app_bar/card.dart';
import 'package:petservice_oop_app/shared/widget/bottomNavigatorBar.dart';

class CustomerSchedule extends StatefulWidget {
  const CustomerSchedule({Key key}) : super(key: key);

  @override
  _CustomerScheduleState createState() => _CustomerScheduleState();
}

class _CustomerScheduleState extends State<CustomerSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(151),
            child: AppBarCustomerScheduled()),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 54,
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Abril",
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("2020",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 10,
                  thickness: 1,
                  indent: 20,
                  endIndent: 5,
                ),
                Container(alignment: Alignment.topCenter, child: CardWidget()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarHome(selectedIndex: 0));
  }
}
