import 'package:flutter/foundation.dart';

class Debug {
  static bool isDebug = true;

  static void logMessage({
    @required Object? message,
    StackTrace? trace,
  }) {
    if (!isDebug) {
      return;
    }
    final text = message.toString();
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    if (kReleaseMode) {
      pattern
          .allMatches(text)
          .forEach((match) => debugPrint('${match.group(0)}'));
    } else {
      if (trace != null) {
        pattern
            .allMatches(text)
            .forEach((match) => debugPrint('${match.group(0)}'));
      } else {
        pattern
            .allMatches(text)
            .forEach((match) => debugPrint('${match.group(0)}'));
      }
    }
  }

  void removeWarning() {}
}
