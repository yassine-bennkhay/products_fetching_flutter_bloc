import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app_ui/constants/strings.dart';
import 'package:real_estate_app_ui/presentation/screens/products_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  void _onItemTaped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  List<Widget> pages=<Widget>[
    const ProductsScreen(),
    const Center(child: Text("Second Screen"),),
  ];
  List<String> appBarTitles=[
    "Home",
    "Cart",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title:  Text(appBarTitles.elementAt(_selectedIndex)),
        centerTitle: true,
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset((ImagePaths.home)),label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset((ImagePaths.cart)),label: "Cart"),
        ],
          currentIndex: _selectedIndex,
        onTap: _onItemTaped,
        selectedItemColor: AppColors.primaryColor,
      ),
    );
  }
}
