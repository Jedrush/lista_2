import 'package:flutter/material.dart';
import 'package:lista_2/providers/items_provider.dart';
import 'package:lista_2/widgets/single_item_to_select.dart';
import 'package:provider/provider.dart';
import 'package:alphabet_list_view/alphabet_list_view.dart';

import '../helpers/db_helper.dart';
import '../widgets/list_of_items_generator.dart';
import '../widgets/single_list_item_widget.dart';
import '../providers/default_items_provider.dart';

class CreateNewListScreen extends StatelessWidget {
  const CreateNewListScreen({Key? key}) : super(key: key);

  static String routeName = '/create_new_string';

  @override
  Widget build(BuildContext context) {
    List<DefaultAppItem> defaults = [
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
        productName: 'Brokul',
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
        productName: 'Drozdze',
        productType: 'baking',
      ),
      DefaultAppItem(
        productName: 'Dzem',
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
        productName: 'Jablko',
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
        productName: 'Kielbasa',
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
        productName: 'Karkowka',
        productType: 'meat',
      ),
      DefaultAppItem(
        productName: 'Kremówka papieska',
        productType: 'sweet',
      )
    ];

    List<String> myLettersList = [];

    List<AlphabetListViewItemGroup> assignProductToTagLetter(
        List<DefaultAppItem> listaPrzedmiotow, List<String> listaLiter) {
      List<AlphabetListViewItemGroup> completedList = [];
      for (DefaultAppItem przedmiot in listaPrzedmiotow) {
        if (listaLiter.contains(przedmiot.productName![0]) == false) {
          listaLiter.add(przedmiot.productName![0].toUpperCase());
        }
        for (String litera in listaLiter) {
          int liczbaPrzedmiotowNaDanaLitere = 0;
          List<DefaultAppItem> listaPrzedmiotowNaDanaLitere = [];
          for (przedmiot in listaPrzedmiotow) {
            if (przedmiot.productName![0].toString().toLowerCase() ==
                litera.toLowerCase()) {
              liczbaPrzedmiotowNaDanaLitere++;
              listaPrzedmiotowNaDanaLitere.add(przedmiot);
            }
          }
          completedList.add(AlphabetListViewItemGroup.builder(
              tag: litera,
              itemCount: liczbaPrzedmiotowNaDanaLitere,
              itemBuilder: (ctx, i) => SingleItemToSelect(
                  productName:
                      listaPrzedmiotowNaDanaLitere[i].productName.toString())));
        }
      }
      return completedList;
    }

    // var itemsProvider = Provider.of<DefaultAppItem>(context);
    final List<AlphabetListViewItemGroup> tech =
        assignProductToTagLetter(defaults, myLettersList);

    //[ AlphabetListViewItemGroup.builder(
    //     tag: 'A',
    //     itemCount: defaults.length,
    //     itemBuilder: (ctx, i) => SingleItemToSelect(
    //         productName: defaults[i].productName.toString()))
    // tag: 'A',
    // itemCount: DefaultAppItem().defaults.length,
    // itemBuilder: (ctx, i) => SingleItemToSelect(
    //   productName: DefaultAppItem().defaults[i].productName.toString(),
    // ),
    //)

    //     (tag: 'A', children: const [
    //   Text('Apple'),
    //   Text('Amazon'),
    //   Text('Alibaba'),
    //   Text('Apple'),
    //   Text('Amazon'),
    //   Text('Alibaba'),
    //   Text('Apple'),
    //   Text('Amazon'),
    //   Text('Alibaba'),
    //   Text('Apple'),
    //   Text('Amazon'),
    //   Text('Alibaba'),
    // ]),
    // AlphabetListViewItemGroup(tag: 'B', children: const [
    //   Text('bpple'),
    //   Text('bmazon'),
    //   Text('blibaba'),
    //   Text('bpple'),
    //   Text('bmazon'),
    //   Text('blibaba'),
    //   Text('bpple'),
    //   Text('bmazon'),
    //   Text('blibaba'),
    //   Text('bpple'),
    //   Text('bmazon'),
    //   Text('blibaba'),
    // ]),
    // AlphabetListViewItemGroup(tag: 'I', children: []),
    // ];
    return Scaffold(
      body: AlphabetListView(
        options: AlphabetListViewOptions(
            listOptions: ListOptions(),
            scrollbarOptions: ScrollbarOptions(
                forcePosition: AlphabetScrollbarPosition.left)),
        items: tech,
      ),
    );
  }
}
