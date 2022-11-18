import 'package:flutter/material.dart';
class ReuseRow extends StatelessWidget {
  String title ,
      description,
      price,
      discountPercentage,
      rating,
      stock,
      brand,
      category;
  ReuseRow({Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('Name : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('Description : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                Text(description,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            ),
          ),
          Row(
            children: [
              Text('Price : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(price,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          Row(
            children: [
              Text('discountPercentage : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(discountPercentage,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          Row(
            children: [
              Text('rating : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(rating,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          Row(
            children: [
              Text('stock : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(stock,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          Row(
            children: [
              Text('brand : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(brand,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),
          Row(
            children: [
              Text('category : ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              Text(category,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ],
          ),

          Text(price),
          Text(description),
          Text(discountPercentage),
          Text(rating),
          Text(stock),
          Text(brand),
          Text(category),

        ],
      ),
    );
  }
}