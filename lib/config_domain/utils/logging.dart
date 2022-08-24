import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:developer' as dev;

class DebugLogger {
  static DebugLogger? _instance;
  static Logger? _logger;
  static final _dateFormatter = DateFormat('H:m:s.S');
  static const appName = 'my_app';

  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);

    _logger = Logger(appName);

    _instance = this;
  }

  factory DebugLogger() => _instance ?? DebugLogger._internal();

  void _recordHandler(LogRecord rec) {
    dev.log('${_dateFormatter.format(rec.time)}: ${rec.message}');
  }

  void log(message, [Object? error, StackTrace? stackTrace]) =>
      _logger?.info(message, error, stackTrace);
}
