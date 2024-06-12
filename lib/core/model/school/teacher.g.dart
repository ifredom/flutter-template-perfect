// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TeacherModel> _$teacherModelSerializer =
    new _$TeacherModelSerializer();

class _$TeacherModelSerializer implements StructuredSerializer<TeacherModel> {
  @override
  final Iterable<Type> types = const [TeacherModel, _$TeacherModel];
  @override
  final String wireName = 'TeacherModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, TeacherModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'level',
      serializers.serialize(object.level, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  TeacherModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeacherModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TeacherModel extends TeacherModel {
  @override
  final String name;
  @override
  final int level;

  factory _$TeacherModel([void Function(TeacherModelBuilder)? updates]) =>
      (new TeacherModelBuilder()..update(updates))._build();

  _$TeacherModel._({required this.name, required this.level}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'TeacherModel', 'name');
    BuiltValueNullFieldError.checkNotNull(level, r'TeacherModel', 'level');
  }

  @override
  TeacherModel rebuild(void Function(TeacherModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeacherModelBuilder toBuilder() => new TeacherModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeacherModel && name == other.name && level == other.level;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeacherModel')
          ..add('name', name)
          ..add('level', level))
        .toString();
  }
}

class TeacherModelBuilder
    implements Builder<TeacherModel, TeacherModelBuilder> {
  _$TeacherModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  TeacherModelBuilder();

  TeacherModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeacherModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TeacherModel;
  }

  @override
  void update(void Function(TeacherModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeacherModel build() => _build();

  _$TeacherModel _build() {
    final _$result = _$v ??
        new _$TeacherModel._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TeacherModel', 'name'),
            level: BuiltValueNullFieldError.checkNotNull(
                level, r'TeacherModel', 'level'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
