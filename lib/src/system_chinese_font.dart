import 'dart:ui';

import 'package:flutter/material.dart';

/// TODO vivo, oppo

class SystemChineseFont {
  const SystemChineseFont._();

  /// Chinese font family fallback, for iOS & macOS
  static const List<String> appleFontFamily = [
    // '.SF UI Text',
    '.AppleSystemUIFont',
    'PingFang SC',
  ];

  /// Chinese font family fallback, for xiaomi & redmi phone
  static const List<String> xiaomiFontFamily = [
    'miui',
    'mipro',
  ];

  /// Chinese font family fallback, for windows
  static const List<String> windowsFontFamily = [
    'Microsoft YaHei',
  ];

  /// Chinese font family fallback, for most platforms
  static const List<String> fontFamilyFallback = [
    "sans-serif",
    ...appleFontFamily,
    ...xiaomiFontFamily,
    ...windowsFontFamily,
  ];

  /// Text style with updated fontFamilyFallback & fontVariations
  static TextStyle get textStyle {
    return const TextStyle().useSystemChineseFont();
  }

  /// Text theme with updated fontFamilyFallback & fontVariations
  static TextTheme get textTheme {
    return Typography().dense.apply(fontFamilyFallback: fontFamilyFallback);
  }
}

extension TextStyleUseSystemChineseFont on TextStyle {
  /// Add fontFamilyFallback & fontVariation to original font style
  TextStyle useSystemChineseFont() {
    return copyWith(
      fontFamilyFallback: [
        ...?fontFamilyFallback,
        ...SystemChineseFont.fontFamilyFallback,
      ],
      fontVariations: [
        ...?fontVariations,
        if (fontWeight != null)
          FontVariation('wght', (fontWeight!.index + 1) * 100),
      ],
    );
  }
}

extension TextThemeUseSystemChineseFont on TextTheme {
  /// Add fontFamilyFallback & fontVariation to original text theme
  TextTheme useSystemChineseFont() {
    return SystemChineseFont.textTheme.merge(this);
  }
}

extension ThemeDataUseSystemChineseFont on ThemeData {
  /// Add fontFamilyFallback & fontVariation to original theme data
  ThemeData useSystemChineseFont() {
    return copyWith(textTheme: textTheme.useSystemChineseFont());
  }
}
