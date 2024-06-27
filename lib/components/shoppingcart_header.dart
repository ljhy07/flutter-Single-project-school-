import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/constants.dart';
import 'shopping_cart_state.dart'; // 상태 관리 클래스를 가져옴

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({Key? key}) : super(key: key);

  @override
  _ShoppingCartHeaderState createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  final List<String> selectedPic = [
    "assets/carrot.jpg",
    "assets/apple.jpg",
    "assets/watermelon.jpg",
    "assets/pimento.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    int selectedId = context.watch<ShoppingCartState>().selectedId;

    return Column(
      children: [
        _buildHeaderPic(selectedId),
        _buildHeaderSelector(context),
      ],
    );
  }

  Widget _buildHeaderPic(int selectedId) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(context, 0, "당근"),
          _buildHeaderSelectorButton(context, 1, "사과"),
          _buildHeaderSelectorButton(context, 2, "수박"),
          _buildHeaderSelectorButton(context, 3, "피망"),
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(BuildContext context, int id, String name) {
    int selectedId = context.watch<ShoppingCartState>().selectedId;

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ShoppingCartState>().updateSelectedId(id);
            },
            child: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Colors.transparent,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.transparent,
            )
          ),
        ],
      ),
    );
  }
}
