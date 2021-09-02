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
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
      (new TeacherModelBuilder()..update(updates)).build();

  _$TeacherModel._({required this.name, required this.level}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'TeacherModel', 'name');
    BuiltValueNullFieldError.checkNotNull(level, 'TeacherModel', 'level');
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
    return $jf($jc($jc(0, name.hashCode), level.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TeacherModel')
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
  _$TeacherModel build() {
    final _$result = _$v ??
        new _$TeacherModel._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'TeacherModel', 'name'),
            level: BuiltValueNullFieldError.checkNotNull(
                level, 'TeacherModel', 'level'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
