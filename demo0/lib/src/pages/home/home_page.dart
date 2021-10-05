import 'dart:async';

import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/pages/home/widgets/product_item.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _refreshController = StreamController<void>();
  var _isGrid = false;

  @override
  Widget build(BuildContext context) {
    List<String> dummy = ["Angular", "React", "Flutter"];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                _isGrid = !_isGrid;
              });
            },
            icon: _isGrid ? const Icon(Icons.grid_3x3) : const Icon(Icons.list) ,
          ),
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(AppSetting.token);
              prefs.remove(AppSetting.username);
              Navigator.pushReplacementNamed(context, AppRoute.login);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder(
        stream: ,
          builder: (context, snapshot) {
            return FutureBuilder<List<Product>>(
              future: NetworkService().getProduct(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(color: Colors.white);
                }

                final products = snapshot.data ?? [];
                return _isGrid ? _buildGridView(products) : _buildListView(products);
              },
            );
          },
      ),
    );
  }

  Widget _buildListView(List<Product> products) {
    return ListView.builder(
      padding: const EdgeInsets.only(top:10),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            child: ProductItem(product: products[index],
              onTap: (){
                print(products[index].name);
              },),
            height: 350,
          ),
        );
      },
      itemCount: products.length,
    );
  }

  Widget _buildGridView(List<Product> products) {
    return RefreshIndicator(
      onRefresh: ()=>{},
      child: GridView.builder(
        padding: const EdgeInsets.only(top:10),
        itemBuilder: (context, index) {
          return ProductItem(product: products[index],
            onTap: (){
              print(products[index].name);
            },);
        },
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.76, // set height ratio -  (itemWidth / itemHeight)
        ),
      ),
    );
  }
}
