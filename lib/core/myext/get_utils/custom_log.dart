import 'dart:developer' as developer;

class Customlog {
  const Customlog();

  static void log(String message,
      {DateTime? time,
      int? sequenceNumber,
      int? level,
      String? name,
      Object? error,
      StackTrace? stackTrace}) {
    final emoji = getEmoji(level);
    //final timeStr = time?.toIso8601String() ?? '';
    final nameStr = name ?? '';
    final errorStr = error?.toString() ?? '';
    final stackTraceStr = stackTrace?.toString() ?? '';

    final logMessage = '$emoji   $nameStr $message $errorStr $stackTraceStr \x1B[0m';
    developer.log(logMessage,
        time: time, sequenceNumber: sequenceNumber, level: level ?? 0);
  }

  static String getEmoji(int? level) {
    switch (level) {
      case 0:
        return '🐛';
      case 1:
        return '🔍';
      case 2:
        return '👀';
      case 3:
        return '🚨';
      case 4:
        return '💩';
      default:
        return '🤷‍♂️';
    }
  }

  static String getColor(int? level) {
    switch (level) {
      case 0:
        return '\x1B[30m';
      case 1:
        return '\x1B[31m';
      case 2:
        return '\x1B[32m';
      case 3:
        return '\x1B[33m';
      case 4:
        return '\x1B[34m';
      default:
        return '\x1B[37m';
    }
  }
}
