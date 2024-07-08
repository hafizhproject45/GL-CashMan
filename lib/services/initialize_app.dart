import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../injection_container.dart' as service_locator;

class InitializeApp {
  InitializeApp._();

  static Future<void> init() async {
    // Initialize service locator
    await service_locator.initLocator();

    // Initialize Package info
    await PackageInfo.fromPlatform();

    // initialize firebase service
    await Firebase.initializeApp();

    // initialize date formating
    initializeDateFormatting();
  }
}
