import 'package:environment_variables_demo/environment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Banner(
        message: Environment.name,
        location: BannerLocation.topEnd,
        child: EnvironmentPage(),
      ),
    );
  }
}

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Environment')),
      body: ListView(
        children: const [
          _EnvironmentValueWidget(
            envKey: 'server_url',
            envValue: Environment.serverUrl,
          ),
          _EnvironmentValueWidget(
            envKey: 'api_key',
            envValue: Environment.apiKey,
          ),
          _EnvironmentValueWidget(
            envKey: 'boolean_value',
            envValue: Environment.booleanValue,
          ),
          _EnvironmentValueWidget(
            envKey: 'number_value',
            envValue: Environment.numberValue,
          ),
          _EnvironmentValueWidget(
            envKey: 'only_dev_value',
            envValue: Environment.onlyDevValue,
          ),
          _EnvironmentValueWidget(
            envKey: 'only_prod_value',
            envValue: Environment.onlyProdValue,
          )
        ],
      ),
    );
  }
}


class _EnvironmentValueWidget extends StatelessWidget {
  const _EnvironmentValueWidget(
      {super.key, required this.envKey, required this.envValue});

  final String envKey;
  final dynamic envValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '$envKey: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '$envValue',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
