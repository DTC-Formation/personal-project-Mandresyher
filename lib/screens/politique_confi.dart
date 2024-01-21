import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PolitiquedeConfidentialite extends StatefulWidget {
  const PolitiquedeConfidentialite({super.key});

  @override
  State<PolitiquedeConfidentialite> createState() =>
      _PolitiquedeConfidentialiteState();
}

class _PolitiquedeConfidentialiteState
    extends State<PolitiquedeConfidentialite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Text(
          'Politique de Confidentialité',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            fixedSize: const Size(50.0, 50.0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Bienvenue sur notre application ! Nous accordons une grande importance à votre vie privée, et nous voulons vous informer de manière transparente sur notre approche.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Collecte d\'Informations',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Nous ne collectons aucune information personnelle identifiable lorsque vous utilisez notre application.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Partage d\'Informations',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Nous ne partageons aucune information personnelle avec des tiers.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    'Noté notre application!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double rating) {
                    print(rating);
                  },
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 130.0,
                vertical: 30,
              ),
              child: Text(
                "Merci Beaucoup!",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
