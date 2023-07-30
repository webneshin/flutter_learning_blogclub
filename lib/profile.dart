import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.background,
        title: Text("Profile"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: theme.colorScheme.onBackground.withOpacity(0.2)),
              ],
            ),
            child: Text(
                "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
          ),
        ],
      ),
    );
  }
}
