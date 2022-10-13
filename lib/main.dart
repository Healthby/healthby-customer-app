import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthby',
      theme: ThemeData(
        // primaryColor: const Color(0xFF0061a4),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0061a4),
          onPrimary: Colors.white,
          secondary: Color(0xFF535f70),
          onSecondary: Colors.white,
          error: Color(0xFFD32F2F),
          onError: Colors.white,
          background: Color(0xFFFDFCFF),
          onBackground: Color(0xFF1A1C1E),
          surface: Color(0xFFFDFCFF),
          onSurface: Color(0xFF1A1C1E),
        ),
        fontFamily: GoogleFonts.ibmPlexSansThai().fontFamily,
        textTheme: GoogleFonts.ibmPlexSansThaiTextTheme(),
      ),
      home: const MyHomePage(title: 'Healthby'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
