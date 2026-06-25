class AppRoutes {
  // Auth
  static const String login = '/';
  static const String studentRoomEntry = '/student/room';
  static const String studentProfileSetup = '/student/profile';

  // Professor
  static const String professorDashboard = '/professor/dashboard';
  static const String professorResults = '/professor/results';
  static const String professorStudents = '/professor/students';
  static const String professorGames = '/professor/games';

  // Student
  static const String studentHome = '/student/home';
  static const String studentGameSelect = '/student/games';
  static const String studentGamePlay = '/student/games/play/:gameId';
  static const String studentRanking = '/student/ranking';
}
