import 'package:e_commerce/pages/widgets/ProductCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functions/fetchProducts.dart';
import '../model/Product.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('e-shop',
            style: TextStyle(
            color: Color(0xFF0C54BE)
      ),),
        backgroundColor: const Color(0xFF0C54BE),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),

        color: const Color(0xFFCED3DC),
        child: FutureBuilder<List<Product>>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ProductCard(product: product);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load products'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
