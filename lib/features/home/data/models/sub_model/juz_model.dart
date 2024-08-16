class Juz {
  final String index;
  final VerseRange verse;

  Juz({
    required this.index,
    required this.verse,
  });

  // لتحويل JSON إلى كائن Dart
  factory Juz.fromJson(Map<String, dynamic> json) {
    return Juz(
      index: json['index'],
      verse: VerseRange.fromJson(json['verse']),
    );
  }

  // لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'verse': verse.toJson(),
    };
  }
}

class VerseRange {
  final String start;
  final String end;

  VerseRange({
    required this.start,
    required this.end,
  });

  // لتحويل JSON إلى كائن Dart
  factory VerseRange.fromJson(Map<String, dynamic> json) {
    return VerseRange(
      start: json['start'],
      end: json['end'],
    );
  }

  // لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }
}
