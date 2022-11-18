import 'dart:convert';

import 'package:api_part10/models/ProductsModel.dart';
import 'package:api_part10/screens/reusablerow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<ProductsModel> getProductsList()async{
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200) {
      return ProductsModel.fromJson(data);

    }else{
      return ProductsModel.fromJson(data);
    }
    
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('API Part 10'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
                 Expanded(
                   child: FutureBuilder<ProductsModel>(
                       future: getProductsList(),
                       builder: (context,snapshot){

                         if(!snapshot.hasData){
                           return Center(
                             child: CircularProgressIndicator(),
                           );
                         }else{
                         return ListView.builder(
                             itemCount: snapshot.data!.products!.length ,

                             itemBuilder: (context,index){
                               return Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   Column(  mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                    ReuseRow(title: snapshot.data!.products![index].title!.toString(),
                                      price: snapshot.data!.products![index].price!.toString(),
                                      description:  snapshot.data!.products![index].description!.toString(),
                                      discountPercentage:  snapshot.data!.products![index].discountPercentage!.toString(),
                                      rating:  snapshot.data!.products![index].rating!.toString(),
                                       stock:  snapshot.data!.products![index].stock!.toString(),
                                      brand:  snapshot.data!.products![index].brand!.toString(),
                                     category:  snapshot.data!.products![index].category!.toString(),

                                    ),



                                     ],
                                   ),
                                   SizedBox(height: 12,),
                                   Container(
                                     height: MediaQuery.of(context).size.height * .4,
                                     width: MediaQuery.of(context).size.width * 1,

                                     child: ListView.builder(
                                         scrollDirection: Axis.horizontal,
                                         itemCount: snapshot.data!.products![index].images!.length,
                                         itemBuilder: (context,position){

                                           return Card(elevation: 12,
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(9)
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(5.0),
                                               child: Container(

                                                 height: MediaQuery.of(context).size.height * .25,
                                                 width: MediaQuery.of(context).size.width * .8,
                                                 decoration: BoxDecoration(
                                                     image: DecorationImage(
                                                         fit: BoxFit.cover,
                                                         image: NetworkImage((snapshot.data!.products![index].images![position].toString())))
                                                 ),

                                               ),
                                             ),
                                           );

                                         }),
                                   ),


                                 ],

                               );

                         });
                         }
                       }),
                 ),
          ],
        ),
      ),
    );
  }
}

