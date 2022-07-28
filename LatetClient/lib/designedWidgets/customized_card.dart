import 'package:flutter/material.dart';
import 'package:latet/main.dart';
import 'package:latet/volunteer.dart';
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
    required Volunteer volunteer,
    required BuildContext context,
  })  : assert(elevation == null || elevation >= 0.0),
        super(
          color: Color(0xFF1D1E33),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          key: key,
          child: TextButtonStateul(
            volunteer: volunteer,
          ),
          //   ],
          // ),
        );
}

class TextButtonStateul extends StatefulWidget {
  final Volunteer volunteer;
  TextButtonStateul({Key? key, required this.volunteer}) : super(key: key);

  @override
  State<TextButtonStateul> createState() => _TextButtonStateulState();
}

class _TextButtonStateulState extends State<TextButtonStateul> {
  @override
  Widget build(BuildContext context) {
    // TODO: Move to constants
    ButtonStyle falseStatusButtonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white38),
        backgroundColor: MaterialStateProperty.all(Color(0x7B79D825)));

    ButtonStyle trueStatusButtonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white38),
        backgroundColor: MaterialStateProperty.all(Color(0x85FF4C20)));

    String btnText() {
      if (!widget.volunteer.status) {
        // TODO: Enter this text to constants
        return 'התחל\nנוכחות';
      }
      return 'סיים\nנוכחות';
    }

    void changeBtnStatus() {
      setState(() {
        widget.volunteer.status = !widget.volunteer.status;
      });
    }

    ButtonStyle changeBtnColor() {
      if (widget.volunteer.status) {
        return trueStatusButtonStyle;
      } else {
        return falseStatusButtonStyle;
      }
    }

    void updateServerOnChange() {
      if (widget.volunteer.status == false) {
        emitAll('start_report', [widget.volunteer.id]);
      } else {
        emitAll('stop_report', [widget.volunteer.id]);
      }
    }

    return TextButton(
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
                      widget.volunteer.fullName,
                      style: buttonTextStyle,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 3.5),
                    Text(
                      widget.volunteer.id.toString(),
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
                    // Before changing button's status, send message about current status to server
                    updateServerOnChange();
                    changeBtnStatus();
                    changeBtnColor();

                    // checkVolStatus(fullName);
                  },
                  style: changeBtnColor(),
                  child: Text(btnText(),
                      style: buttonTextStyle, textAlign: TextAlign.center),
                ),
              ),
            ),
          ]),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsWindow(volunteer: widget.volunteer);
            },
          ),
        );
      },
    );
  }
}
