import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/customized_card.dart';
import 'package:latet/main.dart';

class ReportsWindow extends StatefulWidget {
  final List<dynamic> volunteers;
  const ReportsWindow({Key? key, required this.volunteers}) : super(key: key);
  @override
  State<ReportsWindow> createState() => _ReportsWindowState();
}

// // Todo: change input to list of int (vol_id)
// bool checkVolStatus(String vol_id) {
//   // For data write use emitAll
//   emitAll('checkVolStatus', vol_id);
//   return true;
// }
// void volunteersTo

class _ReportsWindowState extends State<ReportsWindow> {
  List<CustomizedCard> cards = [];

  Widget build(BuildContext context) {
    // print("helloooooooooo ${widget.volunteers.toString()}");
    // print(recievedVolunteersData.getVolunteersListLength());
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
