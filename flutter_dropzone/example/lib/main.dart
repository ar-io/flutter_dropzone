import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DropzoneViewController controller1;
  DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Dropzone example'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    buildZone1(context),
                    Center(child: Text(message1)),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    buildZone2(context),
                    Center(child: Text(message2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onDrop: (ev) {
            print('Zone 1 drop: ${ev.name}');
            setState(() {
              message1 = '${ev.name} dropped';
            });
          },
        ),
      );

  Widget buildZone2(BuildContext context) => Builder(
    builder: (context) => DropzoneView(
      operation: DragOperation.move,
      onCreated: (ctrl) => controller2 = ctrl,
      onLoaded: () => print('Zone 2 loaded'),
      onError: (ev) => print('Zone 2 error: $ev'),
      onDrop: (ev) {
        print('Zone 2 drop: ${ev.name}');
        setState(() {
          message2 = '${ev.name} dropped';
        });
      },
    ),
  );
}