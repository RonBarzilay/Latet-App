import 'package:flutter/material.dart';
import 'package:latet/win/details_win.dart';

TextStyle buttonTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'VarelaRound-Regular',
  fontSize: 12.0,
  letterSpacing: 0.2,
);

TextStyle buttonSubTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white60,
  fontFamily: 'VarelaRound-Regular',
  fontSize: 9.5,
  letterSpacing: 0.18,
);

class CustomizedCard extends Card {
  CustomizedCard({
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
    required String fullName,
    required int volunteerId,
    required BuildContext context,
  })  : assert(elevation == null || elevation >= 0.0),
        super(
          color: Color(0xFF1D1E33),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          key: key,
          child: TextButton(
            child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.account_circle,
                      color: Color(0xFF4D61BF),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName,
                            style: buttonTextStyle,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 3.5),
                          Text(
                            "$volunteerId",
                            style: buttonSubTextStyle,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          )
                        ]),
                    // style: buttonTextStyle,
                  ),
                  // ),
                  // Row(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: () {
                          // checkVolStatus(fullName);
                        },
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.white38),
                            // minimumSize: MaterialStateProperty.all(Size(20, 12)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0x7B79D825))),
                        child: Text("התחל\nנוכחות",
                            style: buttonTextStyle,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsWindow();
                  },
                ),
              );
            },
          ),
          //   ],
          // ),
        );
}
