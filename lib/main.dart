import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/languageCubit.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/utilis/app_theming.dart';
import 'core/routes/page_route_names.dart';
import 'cubit/themeCubit.dart';
import 'l10n/appLocalization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, languageState) {
              return MaterialApp(
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState,
                locale: languageState,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                initialRoute: PagesRouteName.initial,
                onGenerateRoute: AppRoutes.onGeneratedRoute,
              );
            },
          );
        },
      ),
    );
  }
}