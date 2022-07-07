import 'package:flutter/material.dart';
import 'package:latet/designedWidgets/button.dart';
import 'package:latet/main.dart';
import 'package:latet/win/population_win.dart';

class UnitsWindow extends StatelessWidget {
  const UnitsWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget locationButton(String unit, String label) {
      /// locationButton creates button Widget with location_icon instance
      /// from Button class.
      ///
      /// Sets the unit type [unit] and show the label as [label].
      return SafeArea(
          child: Button.unitIconBuiltIn(
        onPressed: () async {
          // For writing user's choices to server
          request.setUnit(unit);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const PopulationWindow();
          }));
        },
        label: Text(label),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('  לתת   |   בחירת יחידה'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('פקמ"ז הוצל"א', 'פקמ"ז\nהוצל"א'),
                    const SizedBox(width: 20),
                    locationButton('פקמ"ז מטבח', 'פקמ"ז\nמטבח')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('יט"ד בצ"פ 382', '    יט"ד\nבצ"פ 382'),
                    const SizedBox(width: 20),
                    locationButton('בא"פ לכיש', 'בא"פ לכיש')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('ענתות אלמ"ר 5004', '    ענתות\nאלמ"ר 5004'),
                    const SizedBox(width: 20),
                    locationButton('איו"ש ימ"ח', 'איו"ש\n ימ"ח')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('חטמ"ר עציון', 'חטמ"ר עציון'),
                    const SizedBox(width: 20),
                    locationButton('חטמ"ר מנשה', 'חטמ"ר מנשה')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('חטמ"ר יהודה', 'חטמ"ר יהודה'),
                    const SizedBox(width: 20),
                    locationButton('נחשונים אגד 214', '  נחשונים\n אגד 214')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('נחשונים 8899', 'נחשונים 8899'),
                    const SizedBox(width: 20),
                    locationButton('מגל"ן', 'מגל"ן')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('חטיבה 55', 'חטיבה 55'),
                    const SizedBox(width: 20),
                    locationButton('בית ליד', 'בית ליד')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    locationButton('בא"ח 35', 'בא"ח 35'),
                    const SizedBox(width: 20),
                    locationButton('דובדבן 217', 'דובדבן 217')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [locationButton('551', '551')],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
