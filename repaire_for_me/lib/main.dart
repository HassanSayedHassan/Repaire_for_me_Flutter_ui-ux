import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:repaire_for_me/providers/progress_state.dart';
import 'package:repaire_for_me/providers/user_id_provider.dart';
import 'package:repaire_for_me/screens/home_screen.dart';
import 'package:repaire_for_me/screens/prof_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:repaire_for_me/widgets/button_nave_bar.dart';

import 'helpers/help_fun.dart';
import 'models/user.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  CurrentUser _user= await HelpFun().getSharedReferences();
  print('useeeer   ${_user.id}');

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return UserProvider();
        },
      ),
    ],
    child:     EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'ar'),
        child: EasyDynamicThemeWidget(child: MyApp(_user))),
  )
  );

}

class MyApp extends StatelessWidget {
  final CurrentUser _user;
  MyApp(this._user);
  var lightThemeData = new ThemeData(
      primaryColor: Color(0xff5CB441),
      backgroundColor: Colors.white,
      textTheme: new TextTheme(button: TextStyle(color: Colors.white70)),
      brightness: Brightness.light,
      accentColor: Color(0xff528034)

  );

  var darkThemeData = ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.black,
      textTheme: new TextTheme(button: TextStyle(color: Colors.black54)),
      brightness: Brightness.dark,
      accentColor: Color(0xff528034)
  );

  @override
  Widget build(BuildContext context) {
    final userProvider= Provider.of<UserProvider>(context ,listen: false);
    userProvider.update_current_user(_user);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: _user.id=='NULL'?ProfileScreen():ButtonNaveBar(),
    );
  }
}




