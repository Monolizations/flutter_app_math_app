import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final String _keyCorrectAnswers = 'correctAnswers';
  final String _keyPlayerName = 'playerName';

  Future<int> getCorrectAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyCorrectAnswers) ?? 0;
  }

  Future<void> setCorrectAnswers(int correctAnswers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyCorrectAnswers, correctAnswers);
  }

  Future<void> resetCorrectAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCorrectAnswers);
  }

  Future<String?> getPlayerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPlayerName);
  }

  Future<void> setPlayerName(String playerName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPlayerName, playerName);
  }

  Future<void> resetPlayerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyPlayerName);
  }
}
