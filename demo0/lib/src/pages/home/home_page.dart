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
  @override
  Widget build(BuildContext context) {
    List<String> dummy = ["Angular", "React", "Flutter"];

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Home"),
        actions: [
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
      body: FutureBuilder<List<Product>>(
        future: NetworkService().getProduct(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(color: Colors.white);
          }

          final products = snapshot.data ?? [];
          return _buildListView(products);
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
}
