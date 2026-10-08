import '../models/models.dart';

Future<List<Annonce>> chargerAnnonces() async {
  await Future.delayed(const Duration(seconds: 2));

  return [
    Annonce(
      id: 'a1',
      titre: 'Vélo à échanger',
      description: 'Vélo en bon état',
      categorie: CategorieAnnonce.objet,
      statut: StatutAnnonce.disponible,
      idProprietaire: 'u1',
    ),
    Annonce(
      id: 'a2',
      titre: 'Aide pour déménagement',
      description: 'Je peux aider le weekend',
      categorie: CategorieAnnonce.service,
      statut: StatutAnnonce.disponible,
      idProprietaire: 'u2',
    ),
    Annonce(
      id: 'a3',
      titre: 'Covoiturage Bizerte - Tunis',
      description: 'Départ à 8h',
      categorie: CategorieAnnonce.covoiturage,
      statut: StatutAnnonce.reservee,
      idProprietaire: 'u3',
    ),
    Annonce(
      id: 'a4',
      titre: 'Livre de programmation',
      description: 'Livre pour débutant',
      categorie: CategorieAnnonce.objet,
      statut: StatutAnnonce.terminee,
      idProprietaire: 'u1',
    ),
    Annonce(
      id: 'a5',
      titre: 'Cours de Dart',
      description: 'Initiation à Dart et Flutter',
      categorie: CategorieAnnonce.service,
      statut: StatutAnnonce.disponible,
      idProprietaire: 'u4',
    ),
  ];
}

bool peutReserver(Annonce annonce) {
  return annonce.statut == StatutAnnonce.disponible;
}