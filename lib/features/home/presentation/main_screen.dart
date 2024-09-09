import 'package:flutter/material.dart';
import 'package:mtiwa_familia/core/l10n/utils/localizations.dart';
import 'package:mtiwa_familia/features/generation_trees/presentation/genealogy_screen.dart';
import 'package:mtiwa_familia/features/message/presentation/messages_screen.dart';
import 'package:mtiwa_familia/features/profil/presentation/screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const GenealogyTreeWidget(),
    //  const MessageScreen(),
    const DiscoverScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.sitemap,
              size: 18,
            ),
            label: context.l10n.tree,
          ),
          // const BottomNavigationBarItem(
          //     icon: FaIcon(FontAwesomeIcons.commentDots), label: ""),
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.disease,
            ),
            label: context.l10n.discovery,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.userGraduate,
            ),
            label: context.l10n.profil,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Screen"));
  }
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Discover Screen"));
  }
}
