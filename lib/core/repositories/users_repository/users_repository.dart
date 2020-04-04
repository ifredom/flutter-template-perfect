import 'package:template/core/model/userinfo/user.dart';

abstract class UsersRepository {
  /// - throws `RepositoryException` if fetch fails
  Future<User> fetchUser(int id);
}
