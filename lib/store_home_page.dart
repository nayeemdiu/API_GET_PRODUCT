import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapi/product_details.dart';
import 'package:getapi/sevices/product_sevice.dart';
import 'package:http/http.dart' as http;

class StoreHomePage extends StatefulWidget {
       const StoreHomePage({Key? key}) : super(key: key);

       @override
       State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Product Home Page'),
        centerTitle: true,
      ),


      body: FutureBuilder(
        future: ProductService().getProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
               return Card(
                 elevation: 8.0,
                 child: ListTile(
                   onTap: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => ProductDetails(id: snapshot.data[index]['id'],),),
                     );
                   },

                   leading: ClipRect(
                       child: Image.network(snapshot.data[index]['image'],
                         fit: BoxFit.fitHeight,
                         height: 100,
                         width: 100,
                   )),
                    title:Text(snapshot.data[index]['title']) ,

                  ),
               );

            },
            );

          }
          return  Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
