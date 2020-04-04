// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_home_bean.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TeacherHomeBean> _$teacherHomeBeanSerializer =
    new _$TeacherHomeBeanSerializer();

class _$TeacherHomeBeanSerializer
    implements StructuredSerializer<TeacherHomeBean> {
  @override
  final Iterable<Type> types = const [TeacherHomeBean, _$TeacherHomeBean];
  @override
  final String wireName = 'TeacherHomeBean';

  @override
  Iterable<Object> serialize(Serializers serializers, TeacherHomeBean object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'messageIcon',
      serializers.serialize(object.messageIcon,
          specifiedType: const FullType(String)),
      'homeWorkIcon',
      serializers.serialize(object.homeWorkIcon,
          specifiedType: const FullType(String)),
      'studentIcon',
      serializers.serialize(object.studentIcon,
          specifiedType: const FullType(String)),
      'teachingPlanIcon',
      serializers.serialize(object.teachingPlanIcon,
          specifiedType: const FullType(String)),
      'checkingState',
      serializers.serialize(object.checkingState,
          specifiedType: const FullType(int)),
    ];
    if (object.nickName != null) {
      result
        ..add('nickName')
        ..add(serializers.serialize(object.nickName,
            specifiedType: const FullType(String)));
    }
    if (object.userImageId != null) {
      result
        ..add('userImageId')
        ..add(serializers.serialize(object.userImageId,
            specifiedType: const FullType(String)));
    }
    if (object.levelCode != null) {
      result
        ..add('levelCode')
        ..add(serializers.serialize(object.levelCode,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TeacherHomeBean deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeacherHomeBeanBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nickName':
          result.nickName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userImageId':
          result.userImageId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'levelCode':
          result.levelCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'messageIcon':
          result.messageIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'homeWorkIcon':
          result.homeWorkIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'studentIcon':
          result.studentIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'teachingPlanIcon':
          result.teachingPlanIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'checkingState':
          result.checkingState = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TeacherHomeBean extends TeacherHomeBean {
  @override
  final String nickName;
  @override
  final String userImageId;
  @override
  final String levelCode;
  @override
  final String messageIcon;
  @override
  final String homeWorkIcon;
  @override
  final String studentIcon;
  @override
  final String teachingPlanIcon;
  @override
  final int checkingState;

  factory _$TeacherHomeBean([void Function(TeacherHomeBeanBuilder) updates]) =>
      (new TeacherHomeBeanBuilder()..update(updates)).build();

  _$TeacherHomeBean._(
      {this.nickName,
      this.userImageId,
      this.levelCode,
      this.messageIcon,
      this.homeWorkIcon,
      this.studentIcon,
      this.teachingPlanIcon,
      this.checkingState})
      : super._() {
    if (messageIcon == null) {
      throw new BuiltValueNullFieldError('TeacherHomeBean', 'messageIcon');
    }
    if (homeWorkIcon == null) {
      throw new BuiltValueNullFieldError('TeacherHomeBean', 'homeWorkIcon');
    }
    if (studentIcon == null) {
      throw new BuiltValueNullFieldError('TeacherHomeBean', 'studentIcon');
    }
    if (teachingPlanIcon == null) {
      throw new BuiltValueNullFieldError('TeacherHomeBean', 'teachingPlanIcon');
    }
    if (checkingState == null) {
      throw new BuiltValueNullFieldError('TeacherHomeBean', 'checkingState');
    }
  }

  @override
  TeacherHomeBean rebuild(void Function(TeacherHomeBeanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeacherHomeBeanBuilder toBuilder() =>
      new TeacherHomeBeanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeacherHomeBean &&
        nickName == other.nickName &&
        userImageId == other.userImageId &&
        levelCode == other.levelCode &&
        messageIcon == other.messageIcon &&
        homeWorkIcon == other.homeWorkIcon &&
        studentIcon == other.studentIcon &&
        teachingPlanIcon == other.teachingPlanIcon &&
        checkingState == other.checkingState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, nickName.hashCode),
                                userImageId.hashCode),
                            levelCode.hashCode),
                        messageIcon.hashCode),
                    homeWorkIcon.hashCode),
                studentIcon.hashCode),
            teachingPlanIcon.hashCode),
        checkingState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TeacherHomeBean')
          ..add('nickName', nickName)
          ..add('userImageId', userImageId)
          ..add('levelCode', levelCode)
          ..add('messageIcon', messageIcon)
          ..add('homeWorkIcon', homeWorkIcon)
          ..add('studentIcon', studentIcon)
          ..add('teachingPlanIcon', teachingPlanIcon)
          ..add('checkingState', checkingState))
        .toString();
  }
}

class TeacherHomeBeanBuilder
    implements Builder<TeacherHomeBean, TeacherHomeBeanBuilder> {
  _$TeacherHomeBean _$v;

  String _nickName;
  String get nickName => _$this._nickName;
  set nickName(String nickName) => _$this._nickName = nickName;

  String _userImageId;
  String get userImageId => _$this._userImageId;
  set userImageId(String userImageId) => _$this._userImageId = userImageId;

  String _levelCode;
  String get levelCode => _$this._levelCode;
  set levelCode(String levelCode) => _$this._levelCode = levelCode;

  String _messageIcon;
  String get messageIcon => _$this._messageIcon;
  set messageIcon(String messageIcon) => _$this._messageIcon = messageIcon;

  String _homeWorkIcon;
  String get homeWorkIcon => _$this._homeWorkIcon;
  set homeWorkIcon(String homeWorkIcon) => _$this._homeWorkIcon = homeWorkIcon;

  String _studentIcon;
  String get studentIcon => _$this._studentIcon;
  set studentIcon(String studentIcon) => _$this._studentIcon = studentIcon;

  String _teachingPlanIcon;
  String get teachingPlanIcon => _$this._teachingPlanIcon;
  set teachingPlanIcon(String teachingPlanIcon) =>
      _$this._teachingPlanIcon = teachingPlanIcon;

  int _checkingState;
  int get checkingState => _$this._checkingState;
  set checkingState(int checkingState) => _$this._checkingState = checkingState;

  TeacherHomeBeanBuilder();

  TeacherHomeBeanBuilder get _$this {
    if (_$v != null) {
      _nickName = _$v.nickName;
      _userImageId = _$v.userImageId;
      _levelCode = _$v.levelCode;
      _messageIcon = _$v.messageIcon;
      _homeWorkIcon = _$v.homeWorkIcon;
      _studentIcon = _$v.studentIcon;
      _teachingPlanIcon = _$v.teachingPlanIcon;
      _checkingState = _$v.checkingState;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeacherHomeBean other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TeacherHomeBean;
  }

  @override
  void update(void Function(TeacherHomeBeanBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TeacherHomeBean build() {
    final _$result = _$v ??
        new _$TeacherHomeBean._(
            nickName: nickName,
            userImageId: userImageId,
            levelCode: levelCode,
            messageIcon: messageIcon,
            homeWorkIcon: homeWorkIcon,
            studentIcon: studentIcon,
            teachingPlanIcon: teachingPlanIcon,
            checkingState: checkingState);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
