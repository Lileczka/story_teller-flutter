import 'dart:math';
import 'text_object.dart';

class FullStory {
  int _questionNumber = 0;
  

  List<Story> _morceauxText = [
    Story('Il était une fois une petite fille appelée Zoé.',1),
    Story('dans un petit village niché au cœur d\'une vallée verdoyante',2),
    Story('qui avait les cheveux rouges. Mais rouges, comme un poisson rouge.',3),
    Story('sa maman l’envoie chercher des châtaignes dans la forêt.',4),
    Story('En chemin, Zoé rencontre un bébé écureuil',5),
    Story("Un jour, alors en se promenant près de la rivière qui traversait le village, une quelque chose d'étrange dans l'eau a apparu.",7),
    Story('tu ne me reconnais pas?',8),
    Story('J’ai faim ! J’ai faim ! J’ai faim !',9),
    Story('Oh, maman, il est vide, ce panier',10),
    Story('Jojo, c’est un vieil écureuil. Un très vieil écureuil',11),
  ];

  String getQuestionText() {
  String texteComplet = '';
  for (Story story in _morceauxText) {
    texteComplet += story.story + ' ';
  }
  return texteComplet;
}
//une autre possibilité
String displayStory() {
   return _morceauxText.map((element) => element.story).join(" ");
}

// prendre un élément random  
String getRandom() {
  return _morceauxText[Random().nextInt(_morceauxText.length)].story;
} 
String addContent = '';
List<int> _usedIndexes = [];
bool isEndOfStory = false;

//méthode qui générer une nouvelle partie aléatoire d'une histoire.
String addStory() {
// Vérifie si toutes les parties de l'histoire ont été utilisées
  if (_usedIndexes.length == _morceauxText.length) {
    //Si la fin de l'histoire est atteinte, retourne "C'est la fin de l'histoire!"
    if (!isEndOfStory) {
      isEndOfStory = true;
      return '\n''C\'est la fin de l\'histoire!';
    } else {
      // Retourne une chaîne de caractères vide
      return '';
    }
  } else {
    int index;
    // Créer une liste d'index non utilisés
    List<int> unusedIndexes = List.generate(_morceauxText.length, (i) => i)
      .where((i) => !_usedIndexes.contains(i))
      .toList();
    // Choisir un index random
    index = unusedIndexes[Random().nextInt(unusedIndexes.length)];
    // Ajouter l'index à la liste des index utilisés
    _usedIndexes.add(index);
    // Récupèrer le texte correspondant à l'index dans la liste _morceauxText
    String newContent = _morceauxText[index].story + '\n';
    //vérifier l'index choisi
    print('Chosen index: $index');
    return newContent;
  }
}

  
}

  








