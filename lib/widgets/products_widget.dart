import 'package:flutter/material.dart';

import '../Modules/ProductData.dart';
// import 'package:osama_project/Modules/ProductData.dart';

Widget productsWidget({required ProductData productsObject}) {
  return Padding(
    padding: const EdgeInsets.all(400),
    child: Container(
      height: 155,
      width: 50,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Color(0XFFD1D3D3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 5, left: 5, right: 2, bottom: 2),
            child: Text(
              '${productsObject.title}',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 2, bottom: 2),
            alignment: Alignment.topLeft,
            child: Text(
              'PRODUCTS DISCRIPTION',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
