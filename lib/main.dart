import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          padding: const EdgeInsets.only(left: 14.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Subtitle(text: "Your Best Bets"),
                HorizontalScrollMovies(),
                Subtitle(text: "Today's Finds for You"),
                HorizontalScrollMovies(),
                Subtitle(text: "Witty TV Dramas"),
                HorizontalScrollMovies(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const Text("TV Shows",
          style: TextStyle(
            fontSize: 24,
          )),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            // Do something when the person button is pressed
          },
        ),
      ],
    );
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class HorizontalScrollMovies extends StatelessWidget {
  const HorizontalScrollMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 100,
            margin: const EdgeInsets.only(right: 10),
          );
        },
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad_outlined),
          label: "Games",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_play_rounded),
          label: "New & Hot",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection_sharp),
          label: "Scenes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_rounded),
          label: "Downloads",
        ),
      ],
    );
  }
}
