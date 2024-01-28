import "dart:async";
import "dart:developer";

import "package:bloc/bloc.dart";
import "package:flutter/widgets.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log("onChange(${bloc.runtimeType}, $change)");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("onError(${bloc.runtimeType}, $error, $stackTrace)");
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  await Supabase.initialize(
    url: "https://cwiaqpxmvljggrrxzwsu.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN3aWFxcHhtdmxqZ2dycnh6d3N1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0NTM3MDMsImV4cCI6MjAyMjAyOTcwM30.ftONbwnDsB4kVj_ggZnSOLW9zrF-z375s_OIOGI0e9Q",
  );

  runApp(await builder());
}

final supabase = Supabase.instance.client;
