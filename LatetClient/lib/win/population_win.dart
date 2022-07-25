import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/button.dart';
import 'package:latet/main.dart';

class PopulationWindow extends StatelessWidget {
  const PopulationWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget populationButton(String populationType) {
      /// populationButton creates button Widget with populationn_icon instance
      /// from Button class.
      ///
      /// Sets the populationType [populationType] and show the label as [populationType].
      return Button.populationIconBuiltIn(
        onPressed: () async {
          // For writing user's choice to server3
          request.setPopulationType(populationType);
          Navigator.pushNamed(context, 'פעולות/אוכלוסיות');
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return const ActionWindow();
          // }));
        },
        label: Text(populationType),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('  ${request.getUnit()}    |   סוג אוכלוסייה'),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  populationButton('גימלאים'),
                  const SizedBox(height: 50),
                  populationButton('יחידים'),
                  const SizedBox(height: 50),
                  populationButton('צרכים מיוחדים')
                ],
              ),
            ),
          ),
        ));
  }
}
