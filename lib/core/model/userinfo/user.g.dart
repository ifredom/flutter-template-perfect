// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.mobile != null) {
      result
        ..add('mobile')
        ..add(serializers.serialize(object.mobile,
            specifiedType: const FullType(String)));
    }
    if (object.nickName != null) {
      result
        ..add('nickName')
        ..add(serializers.serialize(object.nickName,
            specifiedType: const FullType(String)));
    }
    if (object.gender != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(object.gender,
            specifiedType: const FullType(int)));
    }
    if (object.age != null) {
      result
        ..add('age')
        ..add(serializers.serialize(object.age,
            specifiedType: const FullType(String)));
    }
    if (object.provice != null) {
      result
        ..add('provice')
        ..add(serializers.serialize(object.provice,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.area != null) {
      result
        ..add('area')
        ..add(serializers.serialize(object.area,
            specifiedType: const FullType(String)));
    }
    if (object.vipFlag != null) {
      result
        ..add('vipFlag')
        ..add(serializers.serialize(object.vipFlag,
            specifiedType: const FullType(int)));
    }
    if (object.userType != null) {
      result
        ..add('userType')
        ..add(serializers.serialize(object.userType,
            specifiedType: const FullType(String)));
    }
    if (object.validFlag != null) {
      result
        ..add('validFlag')
        ..add(serializers.serialize(object.validFlag,
            specifiedType: const FullType(int)));
    }
    if (object.deleteFlag != null) {
      result
        ..add('deleteFlag')
        ..add(serializers.serialize(object.deleteFlag,
            specifiedType: const FullType(int)));
    }
    if (object.createBy != null) {
      result
        ..add('createBy')
        ..add(serializers.serialize(object.createBy,
            specifiedType: const FullType(String)));
    }
    if (object.createTime != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(object.createTime,
            specifiedType: const FullType(int)));
    }
    if (object.updateBy != null) {
      result
        ..add('updateBy')
        ..add(serializers.serialize(object.updateBy,
            specifiedType: const FullType(String)));
    }
    if (object.updateTime != null) {
      result
        ..add('updateTime')
        ..add(serializers.serialize(object.updateTime,
            specifiedType: const FullType(int)));
    }
    if (object.proviceId != null) {
      result
        ..add('proviceId')
        ..add(serializers.serialize(object.proviceId,
            specifiedType: const FullType(String)));
    }
    if (object.cityId != null) {
      result
        ..add('cityId')
        ..add(serializers.serialize(object.cityId,
            specifiedType: const FullType(String)));
    }
    if (object.regionId != null) {
      result
        ..add('regionId')
        ..add(serializers.serialize(object.regionId,
            specifiedType: const FullType(String)));
    }
    if (object.realName != null) {
      result
        ..add('realName')
        ..add(serializers.serialize(object.realName,
            specifiedType: const FullType(String)));
    }
    if (object.experience != null) {
      result
        ..add('experience')
        ..add(serializers.serialize(object.experience,
            specifiedType: const FullType(String)));
    }
    if (object.levelCode != null) {
      result
        ..add('levelCode')
        ..add(serializers.serialize(object.levelCode,
            specifiedType: const FullType(String)));
    }
    if (object.pwd != null) {
      result
        ..add('pwd')
        ..add(serializers.serialize(object.pwd,
            specifiedType: const FullType(String)));
    }
    if (object.birthday != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(object.birthday,
            specifiedType: const FullType(String)));
    }
    if (object.firstTeachingDate != null) {
      result
        ..add('firstTeachingDate')
        ..add(serializers.serialize(object.firstTeachingDate,
            specifiedType: const FullType(String)));
    }
    if (object.detailAddress != null) {
      result
        ..add('detailAddress')
        ..add(serializers.serialize(object.detailAddress,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.userImageId != null) {
      result
        ..add('userImageId')
        ..add(serializers.serialize(object.userImageId,
            specifiedType: const FullType(String)));
    }
    if (object.openId != null) {
      result
        ..add('openId')
        ..add(serializers.serialize(object.openId,
            specifiedType: const FullType(String)));
    }
    if (object.vipExpireDate != null) {
      result
        ..add('vipExpireDate')
        ..add(serializers.serialize(object.vipExpireDate,
            specifiedType: const FullType(String)));
    }
    if (object.isNewUser != null) {
      result
        ..add('isNewUser')
        ..add(serializers.serialize(object.isNewUser,
            specifiedType: const FullType(bool)));
    }
    if (object.isSetPwd != null) {
      result
        ..add('isSetPwd')
        ..add(serializers.serialize(object.isSetPwd,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobile':
          result.mobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nickName':
          result.nickName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'provice':
          result.provice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vipFlag':
          result.vipFlag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userType':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'validFlag':
          result.validFlag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deleteFlag':
          result.deleteFlag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'createBy':
          result.createBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updateBy':
          result.updateBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateTime':
          result.updateTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'proviceId':
          result.proviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cityId':
          result.cityId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'regionId':
          result.regionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'realName':
          result.realName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'experience':
          result.experience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'levelCode':
          result.levelCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pwd':
          result.pwd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstTeachingDate':
          result.firstTeachingDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detailAddress':
          result.detailAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userImageId':
          result.userImageId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'openId':
          result.openId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vipExpireDate':
          result.vipExpireDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isNewUser':
          result.isNewUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isSetPwd':
          result.isSetPwd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String id;
  @override
  final String token;
  @override
  final String mobile;
  @override
  final String nickName;
  @override
  final int gender;
  @override
  final String age;
  @override
  final String provice;
  @override
  final String city;
  @override
  final String area;
  @override
  final int vipFlag;
  @override
  final String userType;
  @override
  final int validFlag;
  @override
  final int deleteFlag;
  @override
  final String createBy;
  @override
  final int createTime;
  @override
  final String updateBy;
  @override
  final int updateTime;
  @override
  final String proviceId;
  @override
  final String cityId;
  @override
  final String regionId;
  @override
  final String realName;
  @override
  final String experience;
  @override
  final String levelCode;
  @override
  final String pwd;
  @override
  final String birthday;
  @override
  final String firstTeachingDate;
  @override
  final String detailAddress;
  @override
  final String description;
  @override
  final String userImageId;
  @override
  final String openId;
  @override
  final String vipExpireDate;
  @override
  final bool isNewUser;
  @override
  final int isSetPwd;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.token,
      this.mobile,
      this.nickName,
      this.gender,
      this.age,
      this.provice,
      this.city,
      this.area,
      this.vipFlag,
      this.userType,
      this.validFlag,
      this.deleteFlag,
      this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.proviceId,
      this.cityId,
      this.regionId,
      this.realName,
      this.experience,
      this.levelCode,
      this.pwd,
      this.birthday,
      this.firstTeachingDate,
      this.detailAddress,
      this.description,
      this.userImageId,
      this.openId,
      this.vipExpireDate,
      this.isNewUser,
      this.isSetPwd})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        token == other.token &&
        mobile == other.mobile &&
        nickName == other.nickName &&
        gender == other.gender &&
        age == other.age &&
        provice == other.provice &&
        city == other.city &&
        area == other.area &&
        vipFlag == other.vipFlag &&
        userType == other.userType &&
        validFlag == other.validFlag &&
        deleteFlag == other.deleteFlag &&
        createBy == other.createBy &&
        createTime == other.createTime &&
        updateBy == other.updateBy &&
        updateTime == other.updateTime &&
        proviceId == other.proviceId &&
        cityId == other.cityId &&
        regionId == other.regionId &&
        realName == other.realName &&
        experience == other.experience &&
        levelCode == other.levelCode &&
        pwd == other.pwd &&
        birthday == other.birthday &&
        firstTeachingDate == other.firstTeachingDate &&
        detailAddress == other.detailAddress &&
        description == other.description &&
        userImageId == other.userImageId &&
        openId == other.openId &&
        vipExpireDate == other.vipExpireDate &&
        isNewUser == other.isNewUser &&
        isSetPwd == other.isSetPwd;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), token.hashCode), mobile.hashCode), nickName.hashCode), gender.hashCode), age.hashCode), provice.hashCode), city.hashCode), area.hashCode), vipFlag.hashCode), userType.hashCode), validFlag.hashCode), deleteFlag.hashCode), createBy.hashCode),
                                                                                createTime.hashCode),
                                                                            updateBy.hashCode),
                                                                        updateTime.hashCode),
                                                                    proviceId.hashCode),
                                                                cityId.hashCode),
                                                            regionId.hashCode),
                                                        realName.hashCode),
                                                    experience.hashCode),
                                                levelCode.hashCode),
                                            pwd.hashCode),
                                        birthday.hashCode),
                                    firstTeachingDate.hashCode),
                                detailAddress.hashCode),
                            description.hashCode),
                        userImageId.hashCode),
                    openId.hashCode),
                vipExpireDate.hashCode),
            isNewUser.hashCode),
        isSetPwd.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('token', token)
          ..add('mobile', mobile)
          ..add('nickName', nickName)
          ..add('gender', gender)
          ..add('age', age)
          ..add('provice', provice)
          ..add('city', city)
          ..add('area', area)
          ..add('vipFlag', vipFlag)
          ..add('userType', userType)
          ..add('validFlag', validFlag)
          ..add('deleteFlag', deleteFlag)
          ..add('createBy', createBy)
          ..add('createTime', createTime)
          ..add('updateBy', updateBy)
          ..add('updateTime', updateTime)
          ..add('proviceId', proviceId)
          ..add('cityId', cityId)
          ..add('regionId', regionId)
          ..add('realName', realName)
          ..add('experience', experience)
          ..add('levelCode', levelCode)
          ..add('pwd', pwd)
          ..add('birthday', birthday)
          ..add('firstTeachingDate', firstTeachingDate)
          ..add('detailAddress', detailAddress)
          ..add('description', description)
          ..add('userImageId', userImageId)
          ..add('openId', openId)
          ..add('vipExpireDate', vipExpireDate)
          ..add('isNewUser', isNewUser)
          ..add('isSetPwd', isSetPwd))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _mobile;
  String get mobile => _$this._mobile;
  set mobile(String mobile) => _$this._mobile = mobile;

  String _nickName;
  String get nickName => _$this._nickName;
  set nickName(String nickName) => _$this._nickName = nickName;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  String _age;
  String get age => _$this._age;
  set age(String age) => _$this._age = age;

  String _provice;
  String get provice => _$this._provice;
  set provice(String provice) => _$this._provice = provice;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _area;
  String get area => _$this._area;
  set area(String area) => _$this._area = area;

  int _vipFlag;
  int get vipFlag => _$this._vipFlag;
  set vipFlag(int vipFlag) => _$this._vipFlag = vipFlag;

  String _userType;
  String get userType => _$this._userType;
  set userType(String userType) => _$this._userType = userType;

  int _validFlag;
  int get validFlag => _$this._validFlag;
  set validFlag(int validFlag) => _$this._validFlag = validFlag;

  int _deleteFlag;
  int get deleteFlag => _$this._deleteFlag;
  set deleteFlag(int deleteFlag) => _$this._deleteFlag = deleteFlag;

  String _createBy;
  String get createBy => _$this._createBy;
  set createBy(String createBy) => _$this._createBy = createBy;

  int _createTime;
  int get createTime => _$this._createTime;
  set createTime(int createTime) => _$this._createTime = createTime;

  String _updateBy;
  String get updateBy => _$this._updateBy;
  set updateBy(String updateBy) => _$this._updateBy = updateBy;

  int _updateTime;
  int get updateTime => _$this._updateTime;
  set updateTime(int updateTime) => _$this._updateTime = updateTime;

  String _proviceId;
  String get proviceId => _$this._proviceId;
  set proviceId(String proviceId) => _$this._proviceId = proviceId;

  String _cityId;
  String get cityId => _$this._cityId;
  set cityId(String cityId) => _$this._cityId = cityId;

  String _regionId;
  String get regionId => _$this._regionId;
  set regionId(String regionId) => _$this._regionId = regionId;

  String _realName;
  String get realName => _$this._realName;
  set realName(String realName) => _$this._realName = realName;

  String _experience;
  String get experience => _$this._experience;
  set experience(String experience) => _$this._experience = experience;

  String _levelCode;
  String get levelCode => _$this._levelCode;
  set levelCode(String levelCode) => _$this._levelCode = levelCode;

  String _pwd;
  String get pwd => _$this._pwd;
  set pwd(String pwd) => _$this._pwd = pwd;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  String _firstTeachingDate;
  String get firstTeachingDate => _$this._firstTeachingDate;
  set firstTeachingDate(String firstTeachingDate) =>
      _$this._firstTeachingDate = firstTeachingDate;

  String _detailAddress;
  String get detailAddress => _$this._detailAddress;
  set detailAddress(String detailAddress) =>
      _$this._detailAddress = detailAddress;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _userImageId;
  String get userImageId => _$this._userImageId;
  set userImageId(String userImageId) => _$this._userImageId = userImageId;

  String _openId;
  String get openId => _$this._openId;
  set openId(String openId) => _$this._openId = openId;

  String _vipExpireDate;
  String get vipExpireDate => _$this._vipExpireDate;
  set vipExpireDate(String vipExpireDate) =>
      _$this._vipExpireDate = vipExpireDate;

  bool _isNewUser;
  bool get isNewUser => _$this._isNewUser;
  set isNewUser(bool isNewUser) => _$this._isNewUser = isNewUser;

  int _isSetPwd;
  int get isSetPwd => _$this._isSetPwd;
  set isSetPwd(int isSetPwd) => _$this._isSetPwd = isSetPwd;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _token = _$v.token;
      _mobile = _$v.mobile;
      _nickName = _$v.nickName;
      _gender = _$v.gender;
      _age = _$v.age;
      _provice = _$v.provice;
      _city = _$v.city;
      _area = _$v.area;
      _vipFlag = _$v.vipFlag;
      _userType = _$v.userType;
      _validFlag = _$v.validFlag;
      _deleteFlag = _$v.deleteFlag;
      _createBy = _$v.createBy;
      _createTime = _$v.createTime;
      _updateBy = _$v.updateBy;
      _updateTime = _$v.updateTime;
      _proviceId = _$v.proviceId;
      _cityId = _$v.cityId;
      _regionId = _$v.regionId;
      _realName = _$v.realName;
      _experience = _$v.experience;
      _levelCode = _$v.levelCode;
      _pwd = _$v.pwd;
      _birthday = _$v.birthday;
      _firstTeachingDate = _$v.firstTeachingDate;
      _detailAddress = _$v.detailAddress;
      _description = _$v.description;
      _userImageId = _$v.userImageId;
      _openId = _$v.openId;
      _vipExpireDate = _$v.vipExpireDate;
      _isNewUser = _$v.isNewUser;
      _isSetPwd = _$v.isSetPwd;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            token: token,
            mobile: mobile,
            nickName: nickName,
            gender: gender,
            age: age,
            provice: provice,
            city: city,
            area: area,
            vipFlag: vipFlag,
            userType: userType,
            validFlag: validFlag,
            deleteFlag: deleteFlag,
            createBy: createBy,
            createTime: createTime,
            updateBy: updateBy,
            updateTime: updateTime,
            proviceId: proviceId,
            cityId: cityId,
            regionId: regionId,
            realName: realName,
            experience: experience,
            levelCode: levelCode,
            pwd: pwd,
            birthday: birthday,
            firstTeachingDate: firstTeachingDate,
            detailAddress: detailAddress,
            description: description,
            userImageId: userImageId,
            openId: openId,
            vipExpireDate: vipExpireDate,
            isNewUser: isNewUser,
            isSetPwd: isSetPwd);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
