import 'package:card_settings/card_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latet/assets/Constants/constants.dart' as Constants;
import 'package:latet/volunteer.dart';

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
        title: Text('תדפיס אישי  -  ' + volunteer.fullName),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 40),
          child: CardSettings(
            children: <CardSettingsSection>[
              CardSettingsSection(
                header: CardSettingsHeader(
                  // color: Color(0xFF1D1E33),
                  label: "מידע אישי",
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                      label: "",
                      style: Constants.textStyle,
                      unitLabel: "שם פרטי:  " + volunteer.firstName),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "שם משפחה:  " + volunteer.lastName,
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: volunteer.age() + "  :גיל",
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "תאריך לידה:  " +
                        volunteer.dateToView(volunteer.birthDate),
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "עיר:  " + volunteer.city,
                  ),
                ],
              ),
              CardSettingsSection(
                header: CardSettingsHeader(
                  label: 'כללי',
                  labelAlign: TextAlign.center,
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "יחידה:  " + volunteer.unit,
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "סוג אוכלוסייה:  " + volunteer.populationType,
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: 'השתייכות:  ' + volunteer.association,
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "ת.ז. מנהל:  " + volunteer.managerId.toString(),
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
                    style: Constants.textStyle,
                    unitLabel: "תחילת ביטוח:  " +
                        volunteer.dateToView(volunteer.insuranceDateStart),
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel: "סוף ביטוח:  " +
                        volunteer.dateToView(volunteer.insuranceDateEnd),
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
                    style: Constants.textStyle,
                    unitLabel: volunteer.limitHours.toString() +
                        "  :מגבלת שעות חודשית",
                  ),
                  CardSettingsText(
                    label: "",
                    style: Constants.textStyle,
                    unitLabel:
                        "הערות:  " + volunteer.checkForNotes(volunteer.notes),
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
