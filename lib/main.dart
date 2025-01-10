import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod package
import 'app/bindings/ProviderObserver.dart';
import 'app/core/data/local/my_shared_pref.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await  MySharedPref.init();
  runApp(ProviderScope(child: MyApp(),observers: [MyObserver()],  )); // Wrap MyApp in ProviderScope
}
