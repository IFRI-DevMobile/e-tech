class Session {
  static final Session _instance = Session._internal();

  factory Session() {
    return _instance;
  }

  Session._internal();

  String email = '';
}
