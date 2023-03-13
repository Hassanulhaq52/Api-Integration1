import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/products_model.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/api_text.dart';
import 'package:simple_api_integration/widgets/text_container.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<ProductsModel?>(
        future: apiServices.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ProductsModel productsData = snapshot.data!;
            return ListView.builder(
                itemCount: productsData.products.length,
                itemBuilder: (context, index) {
                  final productsDataList = productsData.products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Card(
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            productsDataList.images[0] != 'null'
                                ? Container(
                                    width: double.infinity,
                                    height: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          productsDataList.images[0],
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    padding: const EdgeInsets.all(
                                      20.0,
                                    ),
                                    color: Colors.red,
                                    child: const Text(
                                      'Image Not Available',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                            TextContainer(
                              apiData: "Product Name: ${productsDataList.title}",
                            ),
                            ApiText(
                              apiText:
                                  'Description: ${productsDataList.description}.',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'Price: ${productsDataList.price}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
