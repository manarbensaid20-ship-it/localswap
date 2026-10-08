class Echange {
  String id;
  String idAnnonce;
  String idDemandeur;
  DateTime dateEchange;

  Echange({
    required this.id,
    required this.idAnnonce,
    required this.idDemandeur,
    required this.dateEchange,
  });

  Echange.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idAnnonce = json['idAnnonce'],
        idDemandeur = json['idDemandeur'],
        dateEchange = DateTime.parse(json['dateEchange']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idAnnonce': idAnnonce,
      'idDemandeur': idDemandeur,
      'dateEchange': dateEchange.toIso8601String(),
    };
  }
}