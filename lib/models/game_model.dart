class GameModel {
  final String id;
  final String title;
  final String subject;
  final String description;
  final String iconEmoji;
  final String difficulty;
  final bool isActive;

  const GameModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.iconEmoji,
    required this.difficulty,
    this.isActive = true,
  });

  static List<GameModel> get allGames => [
        const GameModel(
          id: 'math_quiz',
          title: 'Quiz Matemático',
          subject: 'Matemática',
          description: 'Resolva problemas de matemática contra o tempo!',
          iconEmoji: '🔢',
          difficulty: 'Médio',
        ),
        const GameModel(
          id: 'word_hunt',
          title: 'Caça Palavras',
          subject: 'Português',
          description: 'Encontre as palavras escondidas na galáxia!',
          iconEmoji: '🔤',
          difficulty: 'Fácil',
        ),
        const GameModel(
          id: 'science_lab',
          title: 'Laboratório Espacial',
          subject: 'Ciências',
          description: 'Experimentos científicos no espaço sideral!',
          iconEmoji: '🔬',
          difficulty: 'Difícil',
        ),
        const GameModel(
          id: 'history_quest',
          title: 'Missão História',
          subject: 'História',
          description: 'Viaje pelo tempo e descubra fatos históricos!',
          iconEmoji: '🏛️',
          difficulty: 'Médio',
        ),
        const GameModel(
          id: 'geo_explorer',
          title: 'Explorador Galáctico',
          subject: 'Geografia',
          description: 'Explore países e continentes pelo universo!',
          iconEmoji: '🌍',
          difficulty: 'Fácil',
        ),
        const GameModel(
          id: 'english_stars',
          title: 'Estrelas do Inglês',
          subject: 'Inglês',
          description: 'Aprenda inglês entre as estrelas!',
          iconEmoji: '⭐',
          difficulty: 'Fácil',
        ),
      ];
}
