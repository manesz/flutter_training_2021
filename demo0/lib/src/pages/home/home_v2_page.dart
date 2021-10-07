import 'dart:async';

import 'package:badges/badges.dart';
import 'package:demo0/src/bloc/home/home_bloc.dart';
import 'package:demo0/src/bloc/login/login_bloc.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/pages/home/widgets/product_item.dart';
import 'package:demo0/src/viewmodels/menu_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  _HomePageV2State createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  var _isGrid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(HomeEvent_Fetch());
  }

  @override
  Widget build(BuildContext context) {
    // final homeState = context.watch<HomeBloc>().state;
    // final homeState = BlocProvider.of<HomeBloc>(context, listen: true).state;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Home BlocV2"),
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigatorManagementPage(),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return _isGrid
                ? _buildGridView(state.products)
                : _buildListView(state.products);
          },
        ));
  }

  /*
  body: _isGrid
  ? _buildGridView(homeState.products)
      : _buildListView(homeState.products),
  */

  /*
    body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          return _isGrid
              ? _buildGridView(state.products)
              : _buildListView(state.products);
        },
      )
   */

  void _navigatorManagementPage([Product? product]) {
    Navigator.pushNamed(context, AppRoute.management, arguments: product).then(
      (value) => setState(() {}),
    );
  }

  Widget _buildListView(List<Product> products) {
    return RefreshIndicator(
      onRefresh: () async => context.read<HomeBloc>().add(HomeEvent_Fetch()),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              child: ProductItem(
                product: products[index],
                onTap: () => _navigatorManagementPage(products[index]),
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
      onRefresh: () async => context.read<HomeBloc>().add(HomeEvent_Fetch()),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onTap: () => _navigatorManagementPage(products[index]),
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ..._buildMainMenu(context),
          Spacer(),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildProfile() => UserAccountsDrawerHeader(
        currentAccountPicture: Container(
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        accountName: Text('CMDev'),
        accountEmail: Text('support@codemobiles.com'),
      );

  List<ListTile> _buildMainMenu(BuildContext context) {
    final menuViewModel = MenuViewModel()..setInBox = '99';
    return menuViewModel.items
        .map((item) => ListTile(
              onTap: () => item.navigator(context),
              title: Text(item.title),
              leading: _buildBadge(
                item.notification ?? '',
                icon: item.icon,
                iconColor: item.iconColor,
              ),
            ))
        .toList();
  }

  Badge _buildBadge(
    String notification, {
    required IconData icon,
    required Color iconColor,
  }) {
    final isMaxNotification = notification.length >= 3;
    return Badge(
      toAnimate: false,
      shape: isMaxNotification ? BadgeShape.square : BadgeShape.circle,
      borderRadius:
          isMaxNotification ? BorderRadius.circular(8) : BorderRadius.zero,
      showBadge: notification.isNotEmpty,
      badgeContent: Text(
        notification.length >= 4 ? '999+' : notification,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      badgeColor: Colors.red,
      child: FaIcon(
        icon,
        color: iconColor,
      ),
    );
  }

  Builder _buildLogoutButton() => Builder(
        builder: (context) => SafeArea(
          child: ListTile(
              leading: FaIcon(FontAwesomeIcons.signOutAlt),
              title: Text('Log out'),
              onTap: () => context.read<LoginBloc>().add(LoginEvent_Logout())),
        ),
      );
}
