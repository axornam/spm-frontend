import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studentprojectmanager/theme/theme_config.dart';
import 'package:studentprojectmanager/util/consts.dart';
import 'package:studentprojectmanager/view_models/app_provider.dart';
import 'package:studentprojectmanager/view_models/details_provider.dart';
import 'package:studentprojectmanager/view_models/favorites_provider.dart';
import 'package:studentprojectmanager/view_models/genre_provider.dart';
import 'package:studentprojectmanager/view_models/home_provider.dart';
import 'package:studentprojectmanager/views/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => GenreProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        return MaterialApp(
          key: appProvider.key,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: themeData(appProvider.theme),
          darkTheme: themeData(ThemeConfig.darkTheme),
          home: MainScreen(),
        );
      },
    );
  }

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
