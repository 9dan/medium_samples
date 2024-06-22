import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:theme_demo/custom_theme.dart';
import 'package:theme_demo/theme_switcher.dart';

void main() async {
  final themeMode = await ThemeModePersistence.load();
  runApp(MyApp(themeMode: themeMode));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.themeMode});

  final ThemeMode? themeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Signal<ThemeMode> themeModeSignal;

  @override
  void initState() {
    super.initState();
    themeModeSignal = Signal<ThemeMode>(widget.themeMode ?? ThemeMode.system);
  }

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        Provider<Signal<ThemeMode>>(
          create: () => Signal(widget.themeMode ?? ThemeMode.system),
        ),
      ],
      builder: (context) {
        final themeMode = context.observe<ThemeMode>();
        return MaterialApp(
          title: 'Theme Demo',
          themeMode: themeMode,
          // Add custom theme extensions in the ThemeData.extensions field
          // We will be able to access every T extension by
          // using Theme.of(context).extension<T>() method
          darkTheme: MyCustomThemeBuilder.dark(),
          theme: MyCustomThemeBuilder.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myCustomThemeExtension = theme.extension<MyCustomThemeExtension>()!;
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Demo')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ThemeModeSwitcher(),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Custom Color: '),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: myCustomThemeExtension.customColor,
                  ),
                  margin: const EdgeInsets.only(left: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
