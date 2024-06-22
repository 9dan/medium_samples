import 'package:flutter/material.dart';

class MyCustomThemeBuilder {
  const MyCustomThemeBuilder._();

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      extensions: [MyCustomThemeExtension.dark()],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      extensions: [MyCustomThemeExtension.light()],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MyCustomThemeExtension extends ThemeExtension<MyCustomThemeExtension> {
  const MyCustomThemeExtension({
    required this.customColor,
  });

  MyCustomThemeExtension.light() : customColor = Colors.yellow.shade900;

  MyCustomThemeExtension.dark() : customColor = Colors.green.shade900;

  final Color customColor;

  @override
  ThemeExtension<MyCustomThemeExtension> copyWith({
    Color? customColor,
  }) {
    return MyCustomThemeExtension(customColor: customColor ?? this.customColor);
  }

  @override
  ThemeExtension<MyCustomThemeExtension> lerp(
    covariant ThemeExtension<MyCustomThemeExtension>? other,
    double t,
  ) {
    if (other is! MyCustomThemeExtension) return this;
    return MyCustomThemeExtension(
      customColor: Color.lerp(customColor, other.customColor, t)!,
    );
  }
}
