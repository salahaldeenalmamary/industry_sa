import 'package:logger/logger.dart';

class BuildConfig {
  // Singleton pattern for the config instance
  static final BuildConfig instance = BuildConfig._();
  
  final Logger logger;

  BuildConfig._() : logger = Logger(
    level: Level.debug, // Set the log level to debug (can be changed based on needs)
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(methodCount: 2, printTime: true),
  );
}
