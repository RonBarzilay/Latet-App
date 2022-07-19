import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/button.dart';
import 'package:latet/main.dart';
import 'package:latet/volunteer.dart';
import 'package:latet/win/reports_win.dart';

List<Volunteer> fromDynamicToVolunteer(List<dynamic> dynamicVolunteers) {
  List<Volunteer> volunteers = [];
  for (var element in dynamicVolunteers) {
    Volunteer tempVolunteer = Volunteer(
        element[0],
        element[1],
        element[2],
        element[3],
        element[4],
        element[5],
        element[6],
        element[7],
        element[8],
        element[9],
        element[10],
        element[11],
        element[12]);
    volunteers.add(tempVolunteer);
  }
  return volunteers;
}

class ActionWindow extends StatefulWidget {
  const ActionWindow({Key? key}) : super(key: key);

  @override
  State<ActionWindow> createState() => _ActionWindowState();
}

class _ActionWindowState extends State<ActionWindow> {
  @override
  Widget build(BuildContext context) {
    Widget actionButton(String actionType, IconData icon) {
      /// actionButton creates button Widget with populationn_icon instance
      /// from Button class.
      ///
      /// Sets the populationType [populationType] and show the label as [populationType].
      return Button.actionIconBuiltIn(
        onPressed: () async {
          // For writing user's choice to server
          request.setAction(actionType);
          String encodedRequest = jsonEncode(request);
          emitAll('client_request', encodedRequest);
          print(request.toString());
          // todo: check which window should be displayed depends on actionType
          if (request.getAction() == 'דיווח נוכחות') {
            // } else if (actionType == 'דיווח נוכחות') {}

            emitAll('reports', request);

            readAll('get_volunteers_cards');

            // if volNotifier changed, then print value on change
            volNotifier.addListener(() {
              print("A change is detected");

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ReportsWindow(
                    volunteers: fromDynamicToVolunteer(volNotifier.value));
              }));
              // Navigator.removeRoute(
              //   context,
              // );
              // Navigator.pushAndRemoveUntil(context,
              //     MaterialPageRoute(builder: (context) {
              //   return ReportsWindow(
              //       volunteers: fromDynamicToVolunteer(volNotifier.value));
              // }));
            });
          }
        },
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return const ReportsWindow(volunteers: fromDynamicToVolunteer(volNotifier.value));
        //
        // }));

        // final dynamicVolunteers = await readAll('get_volunteers_cards');

        // volunteersData.set_volunteersList(data);
        // print(volunteersDataNotifier.value);
        // print value on change
        icon: Icon(
          icon,
          size: 30.0,
          color: Colors.green,
        ),
        label: Text(actionType),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
              '  ${request.getUnit()}    |   ${request.getPopulationType()}'),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  actionButton('דיווח נוכחות', Icons.add_reaction_outlined),
                  const SizedBox(height: 50),
                  actionButton('פנייה בנושא מתנדב', Icons.quick_contacts_mail),
                  const SizedBox(height: 50),
                  actionButton('פנייה כללית', Icons.add_card_outlined),
                  const SizedBox(height: 50),
                  actionButton('ארכיון פניות שנשלחו', Icons.send_and_archive)
                ],
              ),
            ),
          ),
        ));
  }
}
