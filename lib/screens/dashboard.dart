import 'package:flutter/material.dart';
import 'package:saccoapp/partials/drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text('Sacco')),
      drawer: SaccoDrawer(),
      body: Center(child: Text('Dashboard')),
    );
  }
}
