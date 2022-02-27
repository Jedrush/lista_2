import 'package:flutter/material.dart';

class SingleListItem extends StatelessWidget {
  const SingleListItem(
      {Key? key,
      required this.productId,
      required this.productName,
      this.numberOfItems,
      this.productType,
      this.weight,
      required this.remove})
      : super(key: key);
  final VoidCallback remove;
  final int productId;
  final String productName;
  final String? productType;
  final int? numberOfItems;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      child: Card(
                        child: Center(
                          child: weight == null
                              ? Text(
                                  numberOfItems == null
                                      ? '1'
                                      : numberOfItems.toString(),
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.white),
                                )
                              : Text('$weight kg'),
                        ),
                        color: Colors.amber,
                      ),
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: Text(
                              '$productName and dys is di ID $productId',
                              style: TextStyle(fontSize: 24),
                            ),
                            subtitle: Text(
                                productType == null
                                    ? ''
                                    : productType as String,
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text("Usuń"),
                                onPressed: remove,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              // TextButton(
                              //   child: Text("ni"),
                              //   onPressed: () {},
                              // ),
                              // SizedBox(
                              //   width: 8,
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 8,
                ),
              ],
            ),
          ),
          elevation: 8,
          margin: EdgeInsets.all(10),
        ));
  }
}
//final singleitemlist = List<SingleListItem>.generate(length, (index) => null)
