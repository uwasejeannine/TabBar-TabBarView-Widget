import 'package:flutter/material.dart';

void main() => runApp(const LearnTabBar());

class LearnTabBar extends StatelessWidget {
  const LearnTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimpleTabBar(),
    );
  }
}

class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SimpleTabBarState createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn TabBar and TabBarView'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.chat_bubble), text: "Home"),
            Tab(icon: Icon(Icons.build), text: "Mechanics"),
            Tab(icon: Icon(Icons.car_rental), text: "SpareParts"),
            Tab(icon: Icon(Icons.person_3), text: "Profile"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Home")),
          Center(child: Text("Mechanics")),
          Center(child: Text("SpareParts")),
          Center(child: Text("Profile")),
        ],
      ),
    );
  }
}
