class User {
  final String userId;
  final String userNickname;

  User({this.userId, this.userNickname});
}

class UserData {
  String userId;
  String userNickname;
  List<dynamic> friendList; /// friends list
  List<dynamic> wishList; /// wish list
  List<dynamic> shoppingCart; /// shopping cart

  UserData({
    this.userId,
    this.userNickname,
    this.friendList,
    this.wishList,
    this.shoppingCart
  });
}