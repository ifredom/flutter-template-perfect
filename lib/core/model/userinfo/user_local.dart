import 'package:hive/hive.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';

part 'user_local.g.dart';

/// A Hive Database compatible UserLocal Model
///   - @HiveType(typeId: unique) is necessary for each HiveObject
///   - @HiveField(unique) is necessary if you need the object to persist
@HiveType(typeId: 0)
class UserLocal extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String mobile;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String website;

  UserLocal({
    this.id = '',
    this.name = '',
    this.username = '',
    this.mobile = '',
    this.email = '',
    this.website = '',
  });

  factory UserLocal.fromUser(User user) {
    return UserLocal(
      id: user.id,
      mobile: user.mobile ?? '',
    );
  }

  factory UserLocal.fromMap(Map<String, dynamic> map) {
    return UserLocal(id: map['id'], mobile: map['mobile']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['mobile'] = mobile;
    return map;
  }

  @override
  int get hashCode => id.hashCode ^ mobile.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocal && runtimeType == other.runtimeType && id == other.id && mobile == other.mobile;
}
