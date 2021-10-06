import 'dart:async';

import 'package:demo0/src/bloc/login/login_bloc.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/pages/home/widgets/product_item.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onPressed: () {
                setState(() {
                  _isGrid = !_isGrid;
                });
              },
              icon:
                  _isGrid ? const Icon(Icons.grid_3x3) : const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () =>
                  context.read<LoginBloc>().add(LoginEvent_Logout()),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: StreamBuilder(
          stream: _refreshController.stream,
          builder: (context, snapshot) {
            return FutureBuilder<List<Product>>(
              future: NetworkService().getProduct(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(color: Colors.white);
                }

                final products = snapshot.data ?? [];
                return _isGrid
                    ? _buildGridView(products)
                    : _buildListView(products);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigatorManagementPage(),
          child: const Icon(Icons.add),
        ));
  }


  void _navigatorManagementPage([Product? product]) {
    Navigator.pushNamed(context, AppRoute.management, arguments: product).then(
          (value) => setState(() {}),
    );
  }

  Widget _buildListView(List<Product> products) {
    return RefreshIndicator(
      onRefresh: () async => _refreshController.sink.add(null),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              child: ProductItem(
                product: products[index],
                onTap: () {
                  _navigatorManagementPage(products[index]);
                },
              ),
              height: 350,
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }

  Widget _buildGridView(List<Product> products) {
    return RefreshIndicator(
      onRefresh: () async => _refreshController.sink.add(null),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onTap: () {
              _navigatorManagementPage(products[index]);
            },
          );
        },
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio:
              0.76, // set height ratio -  (itemWidth / itemHeight)
        ),
      ),
    );
  }
}
