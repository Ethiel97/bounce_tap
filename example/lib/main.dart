import 'package:bounce_tap/bounce_tap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Bounce',
        theme: ThemeData(
          //primarySwatch: Colors.indigo[400],
          primaryColor: Colors.indigo[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'Flutter Bounce Demo'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: BounceTap(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Bounce tap button handler called')));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(offset: Offset(0, 5), blurRadius: 10)
              ],
            ),
            child: const Text(
              'Bounce tap',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
      );
}
