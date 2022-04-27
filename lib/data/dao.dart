import 'package:flutter_login/model/authentication.dart';
import 'package:uuid/uuid.dart';

class Dao {
  Authentication validate(String username, String password) {
    if (username == 'rahul' && password == 'rahul123') {
      var uuid = const Uuid();
      return Authentication(true, uuid.v4());
    }
    return Authentication(false, '');
  }
}
