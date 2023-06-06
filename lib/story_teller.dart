import 'dart:math';
import 'text_object.dart';

class FullStory {
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

  List<String> empty = [];

  int getRandom() {
    Random random = Random();

    int randomIndex = random.nextInt(morceauxText.length);
    String randomValue = morceauxText[randomIndex].story;
    print(randomIndex);
    print(randomValue);
    return randomIndex;
  }

  void addRandom(int randomIndex) {
    empty.add(morceauxText[randomIndex].story);
    morceauxText.removeAt(randomIndex);
  }
}







/*
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

  */







