import 'package:mesk/features/home/data/models/sub_model/juz_model.dart';
import 'package:mesk/features/surah_details/domain/entities/surah_list_entity.dart';

class SurahListModel {
  SurahListModel({
    required this.place,
    required this.type,
    required this.count,
    required this.revelationOrder,
    required this.rukus,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.index,
    required this.pages,
    required this.page,
    required this.start,
    required this.juz,
  });

  final String place;
  final String type;
  final int count;
  final int revelationOrder;
  final int rukus;
  final String title;
  final String titleAr;
  final String titleEn;
  final int index;
  final String pages;
  final String page;
  final int start;
  final List<Juz> juz;

  factory SurahListModel.fromJson(Map<String, dynamic> json) {
    return SurahListModel(
      place: json["place"],
      type: json["type"],
      count: json["count"],
      revelationOrder: json["revelationOrder"],
      rukus: json["rukus"],
      title: json["title"],
      titleAr: json["titleAr"],
      titleEn: json["titleEn"],
      index: json['index'] is int ? json['index'] : int.parse(json['index']),
      pages: json["pages"],
      page: json["page"],
      start: json["start"],
      juz: json["juz"] == null
          ? []
          : List<Juz>.from(json["juz"]!.map((x) => Juz.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "place": place,
        "type": type,
        "count": count,
        "revelationOrder": revelationOrder,
        "rukus": rukus,
        "title": title,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "index": index,
        "pages": pages,
        "page": page,
        "start": start,
        "juz": juz.map((x) => x.toJson()).toList(),
      };

  SurahListEntity toEntity() {
    return SurahListEntity(
      type: type,
      verseCount: count,
      titleAr: titleAr,
      index: index,
    );
  }
}
