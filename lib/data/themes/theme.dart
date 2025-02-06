import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280771465),
      surfaceTint: Color(4280771465),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291487487),
      onPrimaryContainer: Color(4278209391),
      secondary: Color(4283457646),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292077045),
      onSecondaryContainer: Color(4281878870),
      tertiary: Color(4284832123),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293647871),
      onTertiaryContainer: Color(4283187554),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4287823882),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      onSurfaceVariant: Color(4282468173),
      outline: Color(4285692030),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4288073208),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197807),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278209391),
      secondaryFixed: Color(4292077045),
      onSecondaryFixed: Color(4278983977),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4281878870),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4280292916),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4283187554),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color.fromARGB(255, 203, 215, 236),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278205015),
      surfaceTint: Color(4280771465),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281954969),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280825925),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284379005),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282069329),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285818763),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285792262),
      onError: Color(4294967295),
      errorContainer: Color(4291767335),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4279112213),
      onSurfaceVariant: Color(4281415484),
      outline: Color(4283257689),
      outlineVariant: Color(4285034100),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4288073208),
      primaryFixed: Color(4281954969),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279917183),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284379005),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282799973),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285818763),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284174193),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4291020748),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293257453),
      surfaceContainerHigh: Color(4292533730),
      surfaceContainerHighest: Color(4291810007),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278202184),
      surfaceTint: Color(4280771465),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278341235),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280102458),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282075993),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281411398),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283384677),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284481540),
      onError: Color(4294967295),
      errorContainer: Color(4288151562),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4278190080),
      outline: Color(4280757554),
      outlineVariant: Color(4282665552),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4288073208),
      primaryFixed: Color(4278341235),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203986),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282075993),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280562753),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283384677),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281871693),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4290165182),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293849590),
      surfaceContainer: Color(4292928488),
      surfaceContainerHigh: Color(4291941850),
      surfaceContainerHighest: Color(4291020748),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288073208),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278203470),
      primaryContainer: Color(4278209391),
      onPrimaryContainer: Color(4291487487),
      secondary: Color(4290234841),
      onSecondary: Color(4280431167),
      secondaryContainer: Color(4281878870),
      onSecondaryContainer: Color(4292077045),
      tertiary: Color(4291805416),
      onTertiary: Color(4281740107),
      tertiaryContainer: Color(4283187554),
      onTertiaryContainer: Color(4293647871),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279243799),
      onSurface: Color(4292928488),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468173),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inversePrimary: Color(4280771465),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197807),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278209391),
      secondaryFixed: Color(4292077045),
      onSecondaryFixed: Color(4278983977),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4281878870),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4280292916),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4283187554),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281743934),
      surfaceContainerLowest: Color(4278914834),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290634239),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278200382),
      primaryContainer: Color(4284454591),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291682031),
      onSecondary: Color(4279707444),
      secondaryContainer: Color(4286747554),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293252607),
      onTertiary: Color(4280950847),
      tertiaryContainer: Color(4288187056),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294955724),
      onError: Color(4283695107),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243799),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4292337124),
      outline: Color(4289573561),
      outlineVariant: Color(4287336856),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inversePrimary: Color(4278209905),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278194976),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278205015),
      secondaryFixed: Color(4292077045),
      onSecondaryFixed: Color(4278326046),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4280825925),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4279569193),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4282069329),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4282467657),
      surfaceContainerLowest: Color(4278519819),
      surfaceContainerLow: Color(4279901730),
      surfaceContainer: Color(4280559660),
      surfaceContainerHigh: Color(4281283383),
      surfaceContainerHighest: Color(4282007106),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293194495),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287810036),
      onPrimaryContainer: Color(4278193431),
      secondary: Color(4293194495),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289971669),
      onSecondaryContainer: Color(4278193431),
      tertiary: Color(4294372607),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291542244),
      onTertiaryContainer: Color(4279174435),
      error: Color(4294962409),
      onError: Color(4278190080),
      errorContainer: Color(4294946468),
      onErrorContainer: Color(4280418305),
      surface: Color(4279243799),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294967295),
      outline: Color(4293652728),
      outlineVariant: Color(4290626506),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928488),
      inversePrimary: Color(4278209905),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278194976),
      secondaryFixed: Color(4292077045),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290234841),
      onSecondaryFixedVariant: Color(4278326046),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291805416),
      onTertiaryFixedVariant: Color(4279569193),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4283191381),
      surfaceContainerLowest: Color(4278190080),
      surfaceContainerLow: Color(4280033316),
      surfaceContainer: Color(4281151797),
      surfaceContainerHigh: Color(4281875520),
      surfaceContainerHighest: Color(4282599243),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
