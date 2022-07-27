import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latet/client_request.dart';
import 'package:latet/win/action_win.dart';
import 'package:latet/win/population_win.dart';
import 'package:latet/win/reports_win.dart';
import 'package:latet/win/units_win.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// ==============================================
///                Do not remove!
/// ==============================================
// const home_nav = 'https://127.0.0.1:5000/';
// to enable web:  flutter config --enable-web
// path to dart-sdk: C:\Users\Administrator\Desktop\flutter\bin\cache\dart-sdk

// final socket = await Socket.connect('localhost', 5000);
// const url = 'http://10.0.2.2:5000/';
// final response = await http.get(Uri.parse(url));

// For data read
// socket.on('message', (data) {
//   print(data);

// For data write use emitAll
// emitAll('message', request.get_unit());
// });
/// ==============================================
///                Do not remove!
/// ==============================================

/// ==============================================
///                Global Variables
/// ==============================================
final request = ClientRequest("", "", "");
// Completer<List<dynamic>> completer = Completer<List<dynamic>>();

ValueNotifier<List<dynamic>> volNotifier = ValueNotifier<List<dynamic>>([]);

// For data write: web
final IO.Socket webSocket = IO.io(
    'http://localhost:5000',
    IO.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .disableReconnection()
        .build());
// For data write: app
final IO.Socket appSocket = IO.io(
    'http://10.0.2.2:5000',
    IO.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .disableReconnection()
        .build());

/// ==============================================
///                Global Functions
/// ==============================================
void emitAll(String event, [data]) {
  /// emitAll (Send/Write) to all clients - app & web.
  ///
  /// Sets the event type [event] and data [data].
  webSocket.emit(event, data);
  appSocket.emit(event, data);
}

void readAll(String event) {
  /// readAll (Read) for all clients from server - app & web.
  ///
  /// On event type [event] - read data [data].

  // appSocket.on(event, (data) => print(data));
  appSocket.on(event, (data) {
    print('appSocket');
    try {
      volNotifier.value = data;
    } on Exception catch (exception) {
      print(exception);
    } catch (error) {
      print(error);
    }
  });

  webSocket.on(event, (data) {
    print('webSocket');
    try {
      volNotifier.value = data ?? "";
    } on Exception catch (exception) {
      print(exception);
    } catch (error) {
      print(error);
    }
  });
}
// return completer.future;
//
//   // appSocket.on(event, (data) => print(data));
//   // print("New data read from event: $event");
//   // appSocket.on(event, (data) {
//   //   if (kDebugMode) {
//   //     print(data);
//   //   }
//   //   final dataList = data as List;
//   //   setx(dataList);
//   // });
// }

void main() => runApp(const LatetApp());

class LatetApp extends StatelessWidget {
  const LatetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'לתת',
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 5000,
        minWidth: 800,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(800, name: MOBILE),
          //ResponsiveBreakpoint.resize(100, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700),
        ],
      ),
      // ThemeData is the Graphics for all windows
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1B2B3F),
          appBarTheme: const AppBarTheme(
            color: Color(0x6D1D1E33),
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const UnitsWindow(),
        'אוכלוסיות/': (context) => const PopulationWindow(),
        'פעולות/אוכלוסיות': (context) => const ActionWindow(),
        'דיווח-נוכחות/פעולות/אוכלוסיות': (context) =>
            ReportsWindow(volunteers: []),
      },
    );
    // home: const UnitsWindow());
  }
}
