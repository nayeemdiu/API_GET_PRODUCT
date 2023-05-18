import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService{


  Future getProduct() async{

    final producturl =Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(producturl);
    return json.decode(response.body);

  }

  Future getSingleProduct(int id) async{

    final producturl =Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(producturl);
    return json.decode(response.body);

  }



}