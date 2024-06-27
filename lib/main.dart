import 'package:flutter/material.dart';
import 'package:project/theme.dart';
import 'package:provider/provider.dart';
import 'package:project/components/shoppingcart_header.dart';
import 'package:project/components/shoppingcart_detail.dart';
import 'package:project/components/shopping_cart_state.dart'; // 상태 관리 클래스를 가져옴

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingCartState(),
      child: MaterialApp(
        theme: theme(),
        home: const ShoppingCartPage(),
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(),
          Expanded(child: ShoppingCartDetail()),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
