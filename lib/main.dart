import 'package:flutter/material.dart';
import 'story_teller.dart';

void main() => runApp(Storyteller());

class Storyteller extends StatelessWidget {
  const Storyteller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 134, 73, 73),
        appBar: AppBar(
          title: const Text('Compose ton histoire :'),
          titleTextStyle: const TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 59, 12, 12)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 244, 115, 60),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/papirus.png"),
                alignment: Alignment.topCenter,
              ),
            ),
            child: const StoryPage(),
           
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
   // création d'une instance de la classe FullStory
  final FullStory fullStory = FullStory();
  // initialisation
  bool showText = false;
  String addContent = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      //taille du button
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        // condition affichage du texte (cacher le text)
        if (showText)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              addContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
       // un widget qui permet de créer un espace disponible vide et flexible dans une colonne ou une ligne ici espace verticale
        const Spacer(),
        // bouton qui appelle la méthode addStory()
        TextButton(
          onPressed: () {
            setState(() {
            showText = true;
        //concatènation de la nouvelle histoire générée à la fin de l'historique précédent.
            addContent += fullStory.addStory();
              print('addStory() called'); 
            });
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size(200, 40),
            ),
            backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 244, 115, 60),
            ),
          ),
          child: const Text(
            'Ajouter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
