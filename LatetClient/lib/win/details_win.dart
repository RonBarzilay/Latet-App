import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latet/volunteer.dart';

TextStyle textStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'VarelaRound-Regular',
  fontSize: 12.0,
  letterSpacing: 0.2,
);

class DetailsWindow extends StatefulWidget {
  final Volunteer volunteer;
  const DetailsWindow({Key? key, required this.volunteer}) : super(key: key);

  @override
  State<DetailsWindow> createState() => _DetailsWindowState();
}

class _DetailsWindowState extends State<DetailsWindow> {
  @override
  Widget build(BuildContext context) {
    final Volunteer volunteer = widget.volunteer;
    return Scaffold(
      appBar: AppBar(
        title: Text('צפייה בתדפיס אישי'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 40),
          child: CardSettings(
            children: <CardSettingsSection>[
              CardSettingsSection(
                header: CardSettingsHeader(
                  color: Color(0xFF1D1E33),
                  label: "מידע אישי",
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: " :שם פרטי" + volunteer.firstName,
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":שם משפחה" + volunteer.lastName,
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":גיל" + volunteer.age(),
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":תאריך לידה",
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":עיר",
                  ),
                ],
              ),
              CardSettingsSection(
                header: CardSettingsHeader(
                  label: 'השתייכות',
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":יחידה",
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":סוג אוכלוסייה",
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":מנהל",
                  ),
                ],
              ),
              CardSettingsSection(
                header: CardSettingsHeader(
                  label: 'ביטוח',
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":תחילת ביטוח",
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":סוף ביטוח",
                  ),
                ],
              ),
              CardSettingsSection(
                header: CardSettingsHeader(
                  label: 'פרטים נוספים',
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":הגבלת שעות",
                  ),
                  CardSettingsText(
                    label: "",
                    style: textStyle,
                    unitLabel: ":הערות",
                    numberOfLines: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//final Volunteer volunteer;
//   DetailsWindow({Key? key, required this.volunteer}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {

//   }
//VolunteerDetails(
//             firstName: "מאור",
//             lastName: "זוהר",
//             age: 20,
//             birthday: DateUtils.dateOnly(DateTime(2002, 6, 13)),
//             city: "אשקלון",
//             limitHours: 50,
//             unit: "פיקוד מרכז",
//             endDateInsurance: DateUtils.dateOnly(DateTime(2023, 1, 1)),
//             manager: "בר סלמן",
//             notes: "מאור המלך ",
//             populationType: "גאון",
//             startDateInsurance: DateUtils.dateOnly(DateTime(2020, 1, 1)),
//           ),
