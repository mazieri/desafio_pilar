import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Layout1Page extends StatefulWidget {
  const Layout1Page({super.key});

  @override
  State<Layout1Page> createState() => _Layout1PageState();
}

class _Layout1PageState extends State<Layout1Page> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    setPage(0);
  }

  setPage(index) {
    setState(() {
      pageIndex = index;
      if (index == 0) {
        Modular.to.navigate("/layout1/pageWords/");
      } else if (index == 1) {
        Modular.to.navigate("/layout1/pageHistory/");
      } else if (index == 2) {
        Modular.to.navigate('/layout1/pageFavorites/');
      } else {
        Modular.to.navigate("/error/");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: setPage,
        items: const [
          BottomNavigationBarItem(
            label: "Words List",
            icon: Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history_edu),
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
