import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtiwa_familia/core/router/routes/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              const SettingsRoute().go(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ProfileHeader(),
          SizedBox(height: 25),
          ProfileCompletionIndicator(),
          SizedBox(height: 10),
          ProfileCompletionCards(),
          SizedBox(height: 35),
          CustomListTiles(),
        ],
      ),
    );
  }
}

class ProfileCompletionCards extends StatelessWidget {
  const ProfileCompletionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final card = profileCompletionCards[index];
          return SizedBox(
            width: 160,
            child: ProfileCompletionCardWidget(card: card),
          );
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.only(right: 5)),
        itemCount: profileCompletionCards.length,
      ),
    );
  }
}

class ProfileCompletionCardWidget extends StatelessWidget {
  final ProfileCompletionCard card;

  const ProfileCompletionCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              card.icon,
              size: 30,
            ),
            const SizedBox(height: 10),
            Text(
              card.title,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(card.buttonText),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget pour la liste des éléments de personnalisation
class CustomListTiles extends StatelessWidget {
  const CustomListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        customListTiles.length,
        (index) {
          final tile = customListTiles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Card(
              elevation: 4,
              shadowColor: Colors.black12,
              child: ListTile(
                leading: Icon(tile.icon),
                title: Text(tile.title),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Données pour les cartes de progression du profil
class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;

  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: FontAwesomeIcons.circleUser,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: FontAwesomeIcons.filePdf,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: FontAwesomeIcons.list,
    buttonText: "Add",
  ),
];

// Données pour les éléments de personnalisation
class CustomListTile {
  final IconData icon;
  final String title;

  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: FontAwesomeIcons.chartPie,
    title: "Activity",
  ),
  CustomListTile(
    icon: FontAwesomeIcons.locationDot,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: FontAwesomeIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: FontAwesomeIcons.arrowRightFromBracket,
  ),
];

class ProfileCompletionIndicator extends StatelessWidget {
  const ProfileCompletionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            "Complete your profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "(1/5)",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// Widget pour l'en-tête du profil
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Rachael Wagner",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Junior Product Designer"),
      ],
    );
  }
}
