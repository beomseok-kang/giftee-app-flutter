import 'package:giftee/Models/user.dart';

class AuthService {

  User _getUser() {
    return User(
      userNickname: 'Fake user nickname',
      userId: 'Fake user Id'
    );
  }

  Stream<User> get user {
    return Stream.value(_getUser()); ///NEED TO ADD ON AUTH STATE CHANGE
  }
}