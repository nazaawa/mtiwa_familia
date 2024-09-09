import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String birthYear;
  final bool isSpouse;

  const MemberCard({super.key, 
    required this.firstName,
    required this.lastName,
    required this.birthYear,
    this.isSpouse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: isSpouse ? Colors.pink : Colors.blue,
            child: const Icon(Icons.person),
          ),
          const SizedBox(height: 8.0),
          Text('$firstName $lastName'),
          Text(birthYear),
          const SizedBox(height: 8.0),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Ajouter un conjoint ou un enfant
            },
          ),
        ],
      ),
    );
  }
}
