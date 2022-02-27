import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefaultAppItem with ChangeNotifier {
  final String? productName;
  final String? productType;

  DefaultAppItem({
    this.productName,
    this.productType,
  });

  String get firstDigit {
    return productName![0].toUpperCase();
  }
  // DefaultAppItem.builder({  required this.productName,
  //   this.productType,}){}
}

final List<DefaultAppItem> defaults = [
  DefaultAppItem(
    productName: 'Arbuz',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Ananas',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Awokado',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Aronia',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Agrest',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Aspiryna',
    productType: 'medicine',
  ),
  DefaultAppItem(
    productName: 'Bekon',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Bakalie',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Bryndza',
    productType: 'dairy',
  ),
  DefaultAppItem(
    productName: 'Brokuł',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Batonik',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Bataty',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Cebula',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Czekolada',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Ciasto',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Chleb',
    productType: 'baking',
  ),
  DefaultAppItem(
    productName: 'Czosnek',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Cukina',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Delicje',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Drożdze',
    productType: 'baking',
  ),
  DefaultAppItem(
    productName: 'Dżem',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Domestos',
    productType: 'cleaning',
  ),
  DefaultAppItem(
    productName: 'Dorsz',
    productType: 'fish',
  ),
  DefaultAppItem(
    productName: 'Dynia',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Eklerki',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Fasola',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Frytki',
    productType: 'frozen',
  ),
  DefaultAppItem(
    productName: 'Fanta',
    productType: 'drink',
  ),
  DefaultAppItem(
    productName: 'Fantazja',
    productType: 'dairy',
  ),
  DefaultAppItem(
    productName: 'Groch',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Granat',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Herbata',
    productType: 'drink',
  ),
  DefaultAppItem(
    productName: 'Halibut',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Hummus',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Indyk',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Imbir',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Jabłko',
    productType: 'fruit',
  ),
  DefaultAppItem(
    productName: 'Jajka',
    productType: 'dairy',
  ),
  DefaultAppItem(
    productName: 'Jalapeno',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Kapusta',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Kiełbasa',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Kurczak',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Kalafior',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Kaczka',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Kisiel',
    productType: 'sweet',
  ),
  DefaultAppItem(
    productName: 'Kukurydza',
    productType: 'vegetable',
  ),
  DefaultAppItem(
    productName: 'Kaszanka',
    productType: 'meat',
  ),
  DefaultAppItem(
    productName: 'Karkówka',
    productType: 'meat',
  )
];


// Widget ListOfProducts() {
//   return ListView.builder(
//     shrinkWrap: true,
//     itemBuilder: (ctx, i) => Card(
//       child: Text(defaults[i].productName),
//     ),
//     itemCount: defaults.length,
//   );
// }
