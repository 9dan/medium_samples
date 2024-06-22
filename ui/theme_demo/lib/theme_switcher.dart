import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_demo/custom_theme.dart';

const _kThemeModeKey = 'kThemeMode';

class ThemeModePersistence {
  static Future<void> save(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_kThemeModeKey, themeMode.name);
  }

  static Future<ThemeMode?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_kThemeModeKey);
    if (name == null) return null;
    try {
      return ThemeMode.values.firstWhere((e) => e.name == name);
    } catch (e) {
      // If the theme mode string is invalid (it was probably manually edited)
      // we return null and let the app use the default theme mode.
      return null;
    }
  }
}

class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(brightness == Brightness.dark ? 'Dark' : 'Light'),
        const SizedBox(width: 16),
        Card(
          elevation: 20,
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () => _switchTheme(context: context),
            icon: Icon(
              brightness == Brightness.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ),
      ],
    );
  }

  void _switchTheme({
    required BuildContext context,
  }) {
    final currentBrightness = Theme.of(context).brightness;
    final newThemeMode =
        currentBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    ThemeModePersistence.save(newThemeMode);
    context.get<Signal<ThemeMode>>().value = newThemeMode;
  }
}
