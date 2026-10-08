import 'package:flutter/material.dart';
import 'models/models.dart';
import 'services/annonces_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final annonces = await chargerAnnonces();

  for (final annonce in annonces) {
    print(
      '${annonce.titre} -> '
      '${annonce.statut.name} -> '
      'Réservable: ${peutReserver(annonce)}',
    );
  }

  runApp(const LocalSwapApp());
}

class LocalSwapApp extends StatelessWidget {
  const LocalSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalSwap',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LocalSwap'),
        ),
        body: const Center(
          child: Text(
            'Bienvenue dans LocalSwap !',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}