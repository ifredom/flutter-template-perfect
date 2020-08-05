// import 'package:template/core/data_sources/users/users_local_data_source.dart';
// import 'package:template/core/data_sources/users/users_remote_data_source.dart';
import 'package:logging/logging.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/exceptions/repository_exception.dart';
import 'package:template/core/exceptions/network_exception.dart';
import 'package:template/core/exceptions/cache_exception.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/services/connectivity/connectivity_service.dart';

import 'users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  // final remoteDataSource = locator<UsersRemoteDataSource>();
  // final localDataSource = locator<UsersLocalDataSource>();
  final connectivityService = locator<ConnectivityService>();
  final _log = Logger("UsersRepositoryImpl");

  @override
  Future<User> fetchUser(int uid) async {
    if (uid == null) {
      throw RepositoryException('uid must not be null');
    }

    try {
      // if (await connectivityService.isConnected) {
      //   final user = await remoteDataSource.fetchUser(uid);
      //   await localDataSource.cacheUser(user);
      //   return user;
      // } else {
      //   final user = await localDataSource.fetchUser(uid);
      //   return user;
      // }
    } on NetworkException catch (e) {
      _log.info('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.info('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }
}
