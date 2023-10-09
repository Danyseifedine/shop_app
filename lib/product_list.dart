import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_detail.dart';
import 'package:shop_app/shoes_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> filters = ['All', 'Addidas', 'Nike', "Bata"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                children: [
                  Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextField(
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(97, 208, 208, 208),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(198, 125, 124, 124),
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(fontWeight: FontWeight.w600),
                            iconColor: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 255, 255, 255),
                        side: const BorderSide(
                            color: Color.fromARGB(155, 214, 214, 214)),
                        label: Text(
                          filters[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedFilter == filter
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : Colors.black,
                            fontWeight: selectedFilter == filter
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Color bg() {
                      if (index % 2 == 0) {
                        return const Color.fromARGB(129, 0, 255, 238);
                      } else if (index % 3 == 0) {
                        return const Color.fromARGB(75, 255, 0, 0);
                      } else {
                        return Colors.grey.shade300;
                      }
                    }

                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetail(product: product);
                            },
                          ),
                        );
                      },
                      child: ShoesCard(
                        title: product['title'] as String,
                        price: product['price'] as int,
                        image: product['imageUrl'] as String,
                        bg: bg(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
