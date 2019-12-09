import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazzer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "Blazzer 2",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 120,
      "price": 100,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProducts(
            productname: productList[index]["name"],
            productpictures: productList[index]["picture"],
            productoldprice: productList[index]["old_price"],
            productprice: productList[index]["price"],
          );
        });
  }
}

class SingleProducts extends StatelessWidget {
  final productname;
  final productpictures;
  final productoldprice;
  final productprice;

  SingleProducts({
    this.productname,
    this.productpictures,
    this.productoldprice,
    this.productprice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productname,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    productname,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                    title: Text("\$$productprice", style: TextStyle(color: Colors.red),),
                ),
              ),
              child: Image.asset(
                productpictures,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}