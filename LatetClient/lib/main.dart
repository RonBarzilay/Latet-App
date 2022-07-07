import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latet/client_request.dart';
import 'package:latet/win/units_win.dart';
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

List<dynamic> readAll(String event) {
  /// readAll (Read) for all clients from server - app & web.
  ///
  /// On event type [event] - read data [data].
  print("New data read from event: $event");
  List<dynamic> returnedData = [];
  webSocket.on(event, (data) {
    returnedData = [(data)];
  });
  appSocket.on(event, (data) {
    print("hello");
    print("hello");
    print("hello");
    returnedData = [(data)];
  });
  // appSocket.on(event, (data) => print(data));

  print("check: $returnedData");
  return returnedData;
}

void main() => runApp(LatetApp());

class LatetApp extends StatelessWidget {
  const LatetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // ThemeData is the Graphics for all windows
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[500],
            appBarTheme: AppBarTheme(
              color: Colors.blueGrey[900],
              centerTitle: true,
              titleTextStyle: const TextStyle(fontSize: 18),
            )),
        debugShowCheckedModeBanner: false,
        home: UnitsWindow());
  }
}
