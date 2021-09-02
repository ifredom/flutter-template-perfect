// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SchoolModel> _$schoolModelSerializer = new _$SchoolModelSerializer();

class _$SchoolModelSerializer implements StructuredSerializer<SchoolModel> {
  @override
  final Iterable<Type> types = const [SchoolModel, _$SchoolModel];
  @override
  final String wireName = 'SchoolModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SchoolModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'teacher',
      serializers.serialize(object.teacher,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TeacherModel)])),
    ];

    return result;
  }

  @override
  SchoolModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchoolModelBuilder();

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
        case 'teacher':
          result.teacher.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TeacherModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SchoolModel extends SchoolModel {
  @override
  final String name;
  @override
  final BuiltList<TeacherModel> teacher;

  factory _$SchoolModel([void Function(SchoolModelBuilder)? updates]) =>
      (new SchoolModelBuilder()..update(updates)).build();

  _$SchoolModel._({required this.name, required this.teacher}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'SchoolModel', 'name');
    BuiltValueNullFieldError.checkNotNull(teacher, 'SchoolModel', 'teacher');
  }

  @override
  SchoolModel rebuild(void Function(SchoolModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchoolModelBuilder toBuilder() => new SchoolModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchoolModel &&
        name == other.name &&
        teacher == other.teacher;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), teacher.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SchoolModel')
          ..add('name', name)
          ..add('teacher', teacher))
        .toString();
  }
}

class SchoolModelBuilder implements Builder<SchoolModel, SchoolModelBuilder> {
  _$SchoolModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<TeacherModel>? _teacher;
  ListBuilder<TeacherModel> get teacher =>
      _$this._teacher ??= new ListBuilder<TeacherModel>();
  set teacher(ListBuilder<TeacherModel>? teacher) => _$this._teacher = teacher;

  SchoolModelBuilder();

  SchoolModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _teacher = $v.teacher.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchoolModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SchoolModel;
  }

  @override
  void update(void Function(SchoolModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SchoolModel build() {
    _$SchoolModel _$result;
    try {
      _$result = _$v ??
          new _$SchoolModel._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'SchoolModel', 'name'),
              teacher: teacher.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'teacher';
        teacher.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SchoolModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
