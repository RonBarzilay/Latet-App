import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../designedWidgets/volunteer_details.dart';

class DetailsWindow extends StatelessWidget {
  const DetailsWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('צפייה בתדפיס אישי'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 40),
          child: VolunteerDetails(
            firstName: "מאור",
            lastName: "זוהר",
            age: 20,
            birthday: DateUtils.dateOnly(DateTime(2002, 6, 13)),
            city: "אשקלון",
            limitHours: 50,
            unit: "פיקוד מרכז",
            endDateInsurance: DateUtils.dateOnly(DateTime(2023, 1, 1)),
            manager: "בר סלמן",
            notes: "מאור המלך ",
            populationType: "גאון",
            startDateInsurance: DateUtils.dateOnly(DateTime(2020, 1, 1)),
          ),
        ),
      ),
    );
  }
}
