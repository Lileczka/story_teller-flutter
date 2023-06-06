import 'package:flutter/material.dart';
import 'package:story_teller/text_object.dart';
import 'story_teller.dart';

void main() => runApp(const Storyteller());

class Storyteller extends StatelessWidget {
  //const Storyteller({super.key});
  const Storyteller({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/papirus.png"),
                alignment: Alignment.topCenter,
              ),
            ),
            margin: const EdgeInsets.only(top: 30),
            child: const StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  //const StoryPage({super.key});
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // création d'une instance de la classe FullStory
  FullStory fullStory = FullStory();
  bool showText = false;

  List<String> empty = [];
  List<Story> morceauxText = [
    const Story('Il était une fois une petite fille appelée Zoé.'),
    const Story('dans un petit village niché au cœur d\'une vallée verdoyante'),
    const Story(
        'avec ces cheveux rouges. Mais rouges, comme un poisson rouge.'),
    const Story('sa maman l’envoie chercher des châtaignes dans la forêt.'),
    const Story('en chemin, Zoé rencontre un bébé écureuil'),
    const Story(
        "un jour, alors en se promenant près de la rivière qui traversait le village, une quelque chose d'étrange dans l'eau a apparu."),
    const Story('Tu ne me reconnais pas?'),
    const Story(
        'dans cette forêt magique, où tout peut arriver, et l\'aventure est toujours au coin du chemin.'),
    const Story('Oh, maman, il est vide, ce panier'),
    const Story(
        'La petite fille a ri et a dansé avec les créatures magiques toute la nuit.'),
    const Story(
        'Soudain, elle a entendu un bruit étrange et a couru pour voir ce que c\'était.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.bottomCenter,
      children: <Widget>[
        const SizedBox(
          height: 90,
        ),
        if (!showText)
          Expanded(
            child: ListView.builder(
              itemCount: fullStory.empty.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    fullStory.empty[index],
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                );
              },
            ),
          ),
        if (!showText && fullStory.morceauxText.isEmpty)
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: Text(
                "C'est la fin",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                int randomValue = fullStory.getRandom();
                setState(() {
                  fullStory.addRandom(randomValue);
                });
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(200, 40),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 244, 115, 60),
                ),
              ),
              child: const Text(
                'Ajouter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
