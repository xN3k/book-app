import 'package:book_app/providers/theme_provider.dart';
import 'package:book_app/screens/favorite_screen.dart';
import 'package:book_app/screens/saved.dart';
import 'package:book_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadMap'),
        actions: [
          IconButton(
            onPressed: themeProvider.toggleTheme,
            icon: themeProvider.isDark
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          //Saved Icon
          NavigationDestination(
            icon: Icon(Icons.save_alt_outlined),
            label: 'Saved',
          ),

          // Favorite Icon
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const SearchSection(),

        //saved page
        const SavedScreen(),

        /// Favorite page
        const FavoriteScreen(),
      ][currentPageIndex],
    );
  }
}
