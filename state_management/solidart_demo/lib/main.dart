import 'package:flutter/material.dart';
import 'package:solidart_demo/pages/resource.dart';
import 'package:solidart_demo/pages/signal.dart';
import 'package:solidart_demo/pages/solid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solidart Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
        dividerTheme: const DividerThemeData(
          thickness: 1,
          space: 1,
          color: Colors.grey,
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        cardTheme: const CardTheme(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solidart Demo')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text('Signal'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignalPage()));
              },
            ),
            ListTile(
              title: const Text('Resource'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ResourcePage()));
              },
            ),
            ListTile(
              title: const Text('Solid'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SolidPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
