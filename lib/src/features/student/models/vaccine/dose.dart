// Model cho một liều vaccine (Dose)
class Dose {
  final String dateAdministered;
  final String dose;
  final String nextDoseDue;
  final String provider;
  final String sideEffects;
  final String site;
  final String vaccinationProgress;

  Dose({
    required this.dateAdministered,
    required this.dose,
    required this.nextDoseDue,
    required this.provider,
    required this.sideEffects,
    required this.site,
    required this.vaccinationProgress,
  });

  // Chuyển đổi từ Map (Firestore) thành Dose
  factory Dose.fromJson(Map<String, dynamic> json) {
    return Dose(
      dateAdministered: json['dateAdministered'] ?? '',
      dose: json['dose'] ?? '',
      nextDoseDue: json['nextDoseDue'] ?? '',
      provider: json['provider'] ?? '',
      sideEffects: json['sideEffects'] ?? '',
      site: json['site'] ?? '',
      vaccinationProgress: json['vaccinationProgress'] ?? '',
    );
  }

  // Chuyển đổi Dose thành Map để lưu vào Firestore
  Map<String, dynamic> toJson() {
    return {
      'dateAdministered': dateAdministered,
      'dose': dose,
      'nextDoseDue': nextDoseDue,
      'provider': provider,
      'sideEffects': sideEffects,
      'site': site,
      'vaccinationProgress': vaccinationProgress,
    };
  }
}