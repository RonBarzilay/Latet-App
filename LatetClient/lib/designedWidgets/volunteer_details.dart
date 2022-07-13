import 'package:flutter/material.dart';

TextStyle textStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'VarelaRound-Regular',
  fontSize: 12.0,
  letterSpacing: 0.2,
);

convertDateToString(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}

class VolunteerDetails extends Card {
  VolunteerDetails({
    @override Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    Padding? padding,
    // required bool borderOnForeground,
    Clip? clipBehavior,
    EdgeInsetsGeometry? margin,
    // bool semanticContainer,
    // required Widget child,
    required String firstName,
    required String lastName,
    required DateTime birthday,
    required int age,
    required String city,
    required DateTime startDateInsurance,
    required DateTime endDateInsurance,
    required String manager,
    required String unit,
    required String populationType,
    required int limitHours,
    required String notes,
  })  : assert(elevation == null || elevation >= 0.0),
        super(
          color: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          key: key,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "שם משפחה: " + " $lastName",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(width: 50),
                      Text(
                        "שם פרטי: " + "$firstName",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "גיל: " + "$age",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(width: 23.5),
                      Text(
                        "תאריך לידה: " + "${convertDateToString(birthday)}",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "עיר: " + "${city}",
                    style: textStyle,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "סוף ביטוח: " +
                            "${convertDateToString(endDateInsurance)}",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "תחילת ביטוח: " +
                            "${convertDateToString(startDateInsurance)}",
                        style: textStyle,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "יחידה: " + "$unit",
                    style: textStyle,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "אוכלוסייה: " + "$populationType",
                    style: textStyle,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "מגבלות שעות חודשיות: " + "$limitHours",
                    style: textStyle,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "רכז: " + "$manager",
                    style: textStyle,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    "הערות: " + "$notes",
                    style: textStyle,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
        );
}
