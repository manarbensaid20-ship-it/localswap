import 'package:flutter/material.dart';

void main() {
  runApp(const LocalSwapApp());
}

class LocalSwapApp extends StatelessWidget {
  const LocalSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalSwap',

      // Thème général de l'application
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087F75),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F8F7),
          foregroundColor: Color(0xFF173B38),
          elevation: 0,
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF087F75),
          foregroundColor: Colors.white,
        ),
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre supérieure
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFDDF3EC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.swap_horiz_rounded,
                color: Color(0xFF087F75),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'LocalSwap',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // Corps de la page
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // En-tête : slogan de LocalSwap
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF087F75),
                      Color(0xFF125B56),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -35,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Color(0x20FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bienvenue sur',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'LocalSwap !',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Partagez, échangez et '
                                'entraidez-vous près de chez vous.',
                                style: TextStyle(
                                  color: Colors.white.withValues(
                                    alpha: 0.92,
                                  ),
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.handshake_rounded,
                          color: Colors.white,
                          size: 55,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // Titre de la zone des annonces
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Annonces à découvrir',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF173B38),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDF3EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'APERÇU',
                      style: TextStyle(
                        color: Color(0xFF087F75),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Zone réservée à la future liste d'annonces (TP4)
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: const [
                    AnnouncementCard(
                      titre: 'Vélo à échanger',
                      description:
                          'Vélo en bon état, idéal pour '
                          'vos déplacements.',
                      categorie: 'Objet',
                      localisation: 'Bizerte',
                      icon: Icons.directions_bike_rounded,
                    ),
                    SizedBox(height: 14),
                    AnnouncementCard(
                      titre: 'Aide aux devoirs',
                      description:
                          'Accompagnement scolaire et '
                          'partage de connaissances.',
                      categorie: 'Service',
                      localisation: 'Bizerte',
                      icon: Icons.menu_book_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bouton de future publication
      floatingActionButton: FloatingActionButton(
        tooltip: 'Publier une annonce',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'La publication sera disponible prochainement.',
              ),
            ),
          );
        },
        child: const Icon(Icons.add_rounded, size: 30),
      ),
    );
  }
}

// Gabarit visuel d'une carte d'annonce
class AnnouncementCard extends StatelessWidget {
  final String titre;
  final String description;
  final String categorie;
  final String localisation;
  final IconData icon;

  const AnnouncementCard({
    super.key,
    required this.titre,
    required this.description,
    required this.categorie,
    required this.localisation,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE3ECE9),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),

        // Stack permet de superposer le badge de catégorie
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration de l'annonce
                  Container(
                    width: 76,
                    height: 82,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5F1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: const Color(0xFF087F75),
                      size: 38,
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Informations de l'annonce
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          titre,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF173B38),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF647572),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: Color(0xFF087F75),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                localisation,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF647572),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Color(0xFF28A66A),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Disponible',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF238553),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Badge de catégorie superposé en haut à droite
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF3EC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  categorie,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF087F75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}