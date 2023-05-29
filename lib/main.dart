import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/l10n/localization.dart';
import 'package:medical_app/resources/route_manager.dart';
import 'package:medical_app/ui/screens/splash/splash_screen.dart';
import 'package:medical_app/user_preferences/user_preferences.dart';
import 'package:medical_app/controller/local_provider.dart';
import 'package:provider/provider.dart' as prov;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MedicalApp());
}

class MedicalApp extends StatefulWidget {
  const MedicalApp({super.key});

  @override
  State<MedicalApp> createState() => _MedicalAppState();
}

class _MedicalAppState extends State<MedicalApp> {
  Locale? locale;
  @override
  void initState() {
    super.initState();
    UserPreferences.getLocaleLanguageCode().then((value) => {
          setState(() {
            LocaleProvider().setLocale(locale = Locale(value));
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return prov.ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: prov.Consumer<LocaleProvider>(builder: (context, model, child) {
        return ScreenUtilInit(
          minTextAdapt: false,
          builder: (context, child) {
            return MaterialApp(
               debugShowCheckedModeBanner: false,
                  onGenerateTitle: (context) =>
                            AppLocalizations.of(context)!.appName,
                            locale: model.locale ?? locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: L10n.all,
              title: 'Medical App',
              initialRoute: SplashScreen.id,
              routes: routes,
            );
          },
        );
      }),
    );
  }
}
