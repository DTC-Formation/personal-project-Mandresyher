import 'package:lastprojects/information/catégorie.dart';

import '../option/option_avancé/data_base.dart';

class Blague {
  int? id;
  String name;
  String contenues;
  String categories;
  bool isFavorite;
  List<String> comments;

  Blague({
    this.id,
    required this.name,
    required this.contenues,
    required this.categories,
    this.isFavorite = false,
    this.comments = const [],
  });

  Future<void> saveToDatabase() async {
    int id = await DatabaseHelper.instance.insertJoke(toMap());
    print('Blague enregistrée avec l\'ID: $id');
  }

  bool containsSearchTerm(String searchTerm) {
    return name.toLowerCase().contains(searchTerm.toLowerCase()) ||
        contenues.toLowerCase().contains(searchTerm.toLowerCase());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contenues': contenues,
      'categories': categories,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  // static where(bool Function(dynamic blague) param0) {}
  // void Like() {
  //   isLiked = !isLiked;
  // }
  void toggleLike() {
    isFavorite = !isFavorite;
  }

  void addComment(String comment) {
    comments.add(comment);
  }
}

final List<Blague> blagues = [
  Blague(
    name: "C'est l'histoire d'un mec qui a 5 bites.",
    contenues: "Son slip lui va comme un gant.",
    categories: categories[0],
  ),
  Blague(
    name: "Qu'est-ce qui sent à la fois les pieds, le cul et la teuch ?",
    contenues: "Un collant roulé en boule.",
    categories: categories[0],
  ),
  Blague(
    name: "C'est l'histoire d'un zoophile qui prend son élan.",
    contenues: "",
    categories: categories[0],
  ),
  Blague(
    name: "C'est l'histoire de l'eunuque décapité",
    contenues: "Une histoire sans queue ni tête.",
    categories: categories[0],
  ),
  Blague(
    name: "Tu connais le cri du spermatozoïde ?",
    contenues: "Bah la prochaine fois, au lieu d’avaler, tu croques.",
    categories: categories[0],
  ),
  Blague(
    name: "C'est l'histoire de 2 putes qui se disputent.",
    contenues: "",
    categories: categories[0],
  ),
  Blague(
    name: "C'est l'histoire d'un poil.",
    contenues: "Avant il était bien, maintenant il est pubien.",
    categories: categories[0],
  ),
  Blague(
    name: "Quelle est la différence entre un rappeur et un campeur ?",
    contenues: "Le rappeur nique ta mère et le campeur monte ta tente.",
    categories: categories[0],
  ),
  Blague(
    name: "Tu connais la définition d'un déséquilibré sexuel ?",
    contenues: "C’est un mec qui bande et qui tombe en avant.",
    categories: categories[0],
  ),
  Blague(
    name: "Une fesse gauche rencontre une fesse droite :",
    contenues: "« Tu ne trouves pas que ça pue dans le couloir ? »",
    categories: categories[0],
  ),
  Blague(
    name: "Comment appelle-t-on un préservatif pour statue ?",
    contenues: "Une capote en glaise.",
    categories: categories[0],
  ),
  Blague(
    name: "C'est l'histoire du nain aux 17 enfants",
    contenues: "Elle est courte, mais elle est bonne.",
    categories: categories[0],
  ),
  Blague(
    name: "Quel est le pire moment dans la vie d'une poule ?",
    contenues: "Quand elle passe du coq à l’âne.",
    categories: categories[0],
  ),
  Blague(
    name: "Un tampon dit à un préservatif :",
    contenues:
        "« – Attention, si tu craques on se retrouve tous les deux au chômage ! »",
    categories: categories[0],
  ),
  Blague(
    name: "Quelle est la différence entre les hommes et la neige ?",
    contenues:
        "Aucune, on ne sait pas combien de centimètres on aura et combien de temps ça durera.",
    categories: categories[0],
  ),
  Blague(
    name: "L'amour, c'est comme les cartes :",
    contenues: "Si on est seul il vaut mieux avoir une bonne main.",
    categories: categories[0],
  ),
  Blague(
    name: "Quel est le point commun entre les maths et le sexe ?",
    contenues: "Plus il y a d’inconnues, plus c’est chaud.",
    categories: categories[0],
  ),
  Blague(
    name: "J'ai une blague sur La Fistinière ...",
    contenues: "… mais elle n’est pas au point",
    categories: categories[0],
  ),
  Blague(
    name: "Deux femmes discutent :",
    contenues:
        "– « Tu fumes après l’amour ? »\n – « Je sais pas, j’ai jamais regardé. »",
    categories: categories[0],
  ),
  Blague(
    name: "Deux hommes parlent sur un banc :",
    contenues:
        "« – Tu ferais quoi si aujourd’hui c’était la dernière journée avant la fin du monde ? \n– Je me taperais tout ce qui bouge et toi? \n – Bah du coup moi je bougerais pas… »",
    categories: categories[0],
  ),
  Blague(
    name: "Hier, un voleur est rentré chez moi, il cherchait de l'argent.",
    contenues: "Je me suis levé et j'ai chercher avec lui.",
    categories: categories[1],
  ),
  Blague(
    name:
        "L'adolescence, c'est quand un enfant passe de « je cours partout en riant » à ",
    contenues:
        "« je marche lentement en tirant la gueule car la vie c'est trop nul »",
    categories: categories[1],
  ),
  Blague(
    name: "Les ADOS, vous en avez marre d'être harcelés par vos PARENTS?",
    contenues:
        "AGISSEZ MAINTENANT!! quittez la maison, cherchez du boulot' Menez votre propre vie puisque vous savez tout!!",
    categories: categories[1],
  ),
  Blague(
    name: "Il y a toujours une lumière au bout du tunnel.",
    contenues: "Bah oui connard! Sinon on appellerait ça une grotte.",
    categories: categories[1],
  ),
  Blague(
    name: "Le chocolat est notre ennemi ",
    contenues: "Mais fuir son ennemi c'est lâche",
    categories: categories[1],
  ),
  Blague(
    name: "C'est un chien qui recontre un crocodile",
    contenues:
        "Le crocodile dit au chien:\n -Salut, sac à puces!\n Et le chien lui répond:\n -Salut, sac à main",
    categories: categories[1],
  ),
  Blague(
    name: "Quand je m'ennuie, j'envoie un SMS à un numéro inconnu et j'écris: ",
    contenues: "C'est bon, j'ai caché le corps...Maintenant, je fais quoi?",
    categories: categories[1],
  ),
  Blague(
    name: "J'ai pas pété",
    contenues:
        "C'est juste que mon cul t'aime tellement, qu'il t'a soufflé un baiser",
    categories: categories[1],
  ),
  Blague(
    name: "Si en plus d'être drôle, il faut aussi être beau/belle",
    contenues: "Je vais jamais m'en sortir!",
    categories: categories[1],
  ),
  Blague(
    name:
        "Quand j'étais petit, j'ai appris que:\n -La chatte étais la femelle du chat...\n -Une chienne celle du chien...\n -Une bite servait à amarrer les bateaux...\n -Les boules étaient toujours accompagnées du cochonnet...\n -Qu'une pipe se fumait...\n -Que 69 était un nombre...",
    contenues: "Puis j'ai grandi et ... Tout est parti en COUILLE!",
    categories: categories[1],
  ),
  Blague(
    name: "L'argent ne fait pas le bonheur",
    contenues: "Vas faire bisou à la facture pour voir!",
    categories: categories[1],
  ),
  Blague(
    name: "Les gars qui disent aux filles: 'arrête de faire la meuf...WESH?!'",
    contenues: "Tu veux qu'elle fasse quoi ?Le dauphin ?",
    categories: categories[1],
  ),
  Blague(
    name: "Tu pleures???",
    contenues: "Non, je transpire des yeux connard!!!",
    categories: categories[1],
  ),
  Blague(
    name:
        "Je viens de lire un bouquin sur les méfaits de l'alcool, ça fait peur.",
    contenues: "A partir d'aujourd'hui j'arrête de lire.",
    categories: categories[1],
  ),
  Blague(
    name: "L'inventeur du mot 'TUMEUR'",
    contenues: "Voulait-il faire de l'humour noir?",
    categories: categories[1],
  ),
  Blague(
    name: "Je ne suis pas parfaite.",
    contenues: "Normale, je suis une édition limité",
    categories: categories[1],
  ),
  Blague(
    name: "Les girafes n'existe pas ...",
    contenues: "C'est un cou monté.",
    categories: categories[1],
  ),
  Blague(
    name: "Savez-vous pourquoi les Mexicains aiment manger aux toilettes ?",
    contenues: "Parce qu'ils aiment manger épicé.",
    categories: categories[1],
  ),
  Blague(
    name:
        "Je pense que la femme qui a inventé la phrase 'les hommes sont tous les même était:",
    contenues: "Une chinoise qui a perdu son mari dans la foule.",
    categories: categories[1],
  ),
  Blague(
    name: "Avant de te moquer de ta mère qui galère avec son smartphone",
    contenues:
        "Rappel toi qu'un jour, elle a du t'apprendre à te servir d'une fourchette.",
    categories: categories[1],
  ),
  Blague(
    name: "Qu'est-ce qui est petit, rond, vert, qui monte et qui descend ?",
    contenues: "un petit poids dans un ascenseur",
    categories: categories[2],
  ),
  Blague(
    name: "Comment appelle-t-on une vieille barbe à papa ?",
    contenues: "une barbe à papi",
    categories: categories[2],
  ),
  Blague(
    name: "Quel est le pain préféré des magiciens ?",
    contenues: "la baguette",
    categories: categories[2],
  ),
  Blague(
    name:
        "Qu'est-ce qui peut faire le tour du monde en restant dans son coin ?",
    contenues: " un timbre",
    categories: categories[2],
  ),
  Blague(
    name:
        "Qu'est-ce qui est le plus lourd entre un kilo de pierre et un kilo de plume ?",
    contenues: "aucun des deux, ils font le même poids, un kilo",
    categories: categories[2],
  ),
  Blague(
    name: "Qu'est-ce qui est jaune et qui court très vite ?",
    contenues: "un citron pressé",
    categories: categories[2],
  ),
  Blague(
    name: "Qu'est-ce qui est petit et marron ?",
    contenues: "un petit marron",
    categories: categories[2],
  ),
  Blague(
    name: "Pourquoi les souris n'aiment pas jouer aux devinettes ?",
    contenues: "parce qu'elles ont peur de donner leur langue au chat",
    categories: categories[2],
  ),
  Blague(
    name:
        "Je ne fais pas de bruit et pourtant, je réveille tout le monde, qui suis-je ?",
    contenues: "le soleil",
    categories: categories[2],
  ),
  Blague(
    name:
        "J'ai deux pieds, six jambes, huit bras, deux têtes et un oeil, qui suis-je ?",
    contenues: "un menteur",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague de la chaise ?",
    contenues: "Elle est pliante.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague de la chaise ?",
    contenues: "Elle est tellement longue.",
    categories: categories[2],
  ),
  Blague(
    name: " Tu connais l'histoire du lit superposé ?",
    contenues: "C'est une histoire à dormir debout.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague sur les magasins ?",
    contenues: "Elle a pas supermarché.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais l'histoire de la feuille ?",
    contenues: "Elle déchire.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague de la Ferrari ?",
    contenues: "Trop tard, elle est partie.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague du petit déjeuner ?",
    contenues: "Pas d'bol.",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague qui tue ?",
    contenues: "PAN !",
    categories: categories[2],
  ),
  Blague(
    name: "Tu connais la blague à deux balles ?",
    contenues: "PAN ! PAN !",
    categories: categories[2],
  ),
  Blague(
    name: "Quel est le comble pour une chauve-souris ?",
    contenues: " Être chauve",
    categories: categories[2],
  ),
//   Blague(
//   name: myJoke.setup ?? '',
//   contenues: myJoke.delivery ?? '',
//   categories: categories[3],
// )
];
