class Ayah {
  final String nameOfSurah;
  final int numberOfAyah;
  final String arabText;
  final String idTranslation;

  const Ayah({
    required this.nameOfSurah,
    required this.numberOfAyah,
    required this.arabText,
    required this.idTranslation,
  });

  factory Ayah.fromJson(Map<String, dynamic> dataJson) {
    var json = dataJson['data'];
    return Ayah(
      nameOfSurah: json['nameOfSurah']['transliteration']['id'] as String,
      numberOfAyah: json['numberOfAyah'] as int,
      arabText: json['ayah']['text']['arab'],
      idTranslation: json['ayah']['translation']['id'] as String,
    );
  }
}
