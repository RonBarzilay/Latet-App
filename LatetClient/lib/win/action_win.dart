import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/button.dart';
import 'package:latet/main.dart';
import 'package:latet/win/reports_win.dart';

class ActionWindow extends StatelessWidget {
  const ActionWindow({Key? key}) : super(key: key);

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
            emitAll('reports', request);
            readAll("get_volunteers_cards");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ReportsWindow();
            }));
          }
        },
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
