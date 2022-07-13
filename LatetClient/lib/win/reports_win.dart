import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/customized_card.dart';
import 'package:latet/main.dart';

class ReportsWindow extends StatefulWidget {
  const ReportsWindow({Key? key}) : super(key: key);

  @override
  State<ReportsWindow> createState() => _ReportsWindowState();
}

// // Todo: change input to list of int (vol_id)
// bool checkVolStatus(String vol_id) {
//   // For data write use emitAll
//   emitAll('checkVolStatus', vol_id);
//   return true;
// }

class _ReportsWindowState extends State<ReportsWindow> {
  Widget build(BuildContext context) {
    List<CustomizedCard> cards = [
      CustomizedCard(
        fullName: "משה פרץ",
        volunteerId: 123123123,
        context: context,
      ),
      CustomizedCard(
        fullName: "אריאל אילוז",
        volunteerId: 456456456,
        context: context,
      ),
      CustomizedCard(
        fullName: "רוןןןןןןן ברזילי",
        volunteerId: 789789789,
        context: context,
      ),
      CustomizedCard(
        fullName: "מאור זוהרררררררררררררררררר",
        volunteerId: 101101101,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "עדי ויינשטיין",
        volunteerId: 111111111,
        context: context,
      ),
      CustomizedCard(
        fullName: "יוסף אביחי שם-טוב",
        volunteerId: 222222222,
        context: context,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
              '  ${request.getUnit()}    |   ${request.getPopulationType()}'),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: cards,
              ),
            ),
          ),
        ));
  }
}
