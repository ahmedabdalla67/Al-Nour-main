class HadithEntity {
  final String hadith;
  final int number;
  final String? description;
  final String url;
  final bool isDownloaded;

  HadithEntity(
      {required this.url,
      required this.isDownloaded,
      required this.hadith,
      required this.number,
      required this.description});
}
