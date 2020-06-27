import 'package:flutter/material.dart';
import 'package:giftee/Models/user.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Center(
      child: Column(
        children: [
          Text(user.userId + '  ' + user.userNickname),
          SizedBox(height: 20,),
          Text('Account Page\nAn account page should have all the details of the user\'s account, and his wish items, and etc.'),
        ],
      ),
    );
  }
}
