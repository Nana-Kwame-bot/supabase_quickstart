import "package:flutter/material.dart";
import "package:supabase_quickstart/account/page/account_page.dart";
import "package:supabase_quickstart/l10n/l10n.dart";
import "package:supabase_quickstart/login/page/login_page.dart";
import "package:supabase_quickstart/splash/page/splash_page.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (_) => const SplashPage(),
        "/login": (_) => const LoginPage(),
        "/account": (_) => const AccountPage(),
      },
    );
  }
}
