import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapi/sevices/product_sevice.dart';

class ProductDetails extends StatelessWidget {
  int id;
  ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: ProductService().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                        snapshot.data['category'],
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.indigo),

                       ),
                  Text(snapshot.data['title']),
                 // Text(snapshot.data['price']),
                  Text(snapshot.data['description']),
                  // Text(snapshot.data['category'])
                  Container(
                    child: Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: 200,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(), color: Colors.brown),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
