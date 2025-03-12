import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/app.dart';
import 'package:workify/core/bloc_observer.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.initialSharedPreference();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setUp();
  Bloc.observer = MyBlocObserver();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}
