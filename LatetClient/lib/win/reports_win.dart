import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/customized_card.dart';
import 'package:latet/main.dart';
import 'package:latet/volunteers_data.dart';

class ReportsWindow extends StatefulWidget {
  const ReportsWindow(VolunteersData recievedVolunteersData, {Key? key})
      : super(key: key);

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
  List<CustomizedCard> cards = [
    CustomizedCard(
      fullName: "משה פרץ",
      volunteerId: 123123123,
    ),
    CustomizedCard(
      fullName: "אריאל אילוז",
      volunteerId: 456456456,
    ),
    CustomizedCard(
      fullName: "רוןןןןןןן ברזילי",
      volunteerId: 789789789,
    ),
    CustomizedCard(
      fullName: "מאור זוהרררררררררררררררררר",
      volunteerId: 101101101,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "יעקב סעדו",
      volunteerId: 1515155,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "עדי ויינשטיין",
      volunteerId: 111111111,
    ),
    CustomizedCard(
      fullName: "יוסף אביחי שם-טוב",
      volunteerId: 222222222,
    ),
  ];

  Widget build(BuildContext context) {
    print(recievedVolunteersData.getvolunteersListLength());

    // void generateCard(List<VolunteersData> volunteers){
    //   for (int i=0; i<volunteers.length; i++) {
    //     cards.add(
    //         CustomizedCard(
    //           fullName: volunteers[i].get
    //           volunteerId: 111111111,
    //         )
    //     )
    //   }
    // }

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
