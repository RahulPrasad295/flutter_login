import 'package:flutter_login/data/dao.dart';
import 'package:flutter_login/model/authentication.dart';

class Repository {
  final dao = Dao();

  Authentication validate(String username, String password) =>
      dao.validate(username, password);
}
