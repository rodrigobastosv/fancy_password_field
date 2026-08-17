import 'package:material_ui/material_ui.dart';

import 'samples/samples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Change this to one of the available samples on the samples folder
            Sample1(),
          ],
        ),
      ),
    );
  }
}
