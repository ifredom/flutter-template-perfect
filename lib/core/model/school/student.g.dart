// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudentModel> _$studentModelSerializer =
    new _$StudentModelSerializer();

class _$StudentModelSerializer implements StructuredSerializer<StudentModel> {
  @override
  final Iterable<Type> types = const [StudentModel, _$StudentModel];
  @override
  final String wireName = 'StudentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'level',
      serializers.serialize(object.level, specifiedType: const FullType(int)),
      'students',
      serializers.serialize(object.students,
          specifiedType:
              const FullType(BuiltList, const [const FullType(StudentModel)])),
    ];

    return result;
  }

  @override
  StudentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentModelBuilder();

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
        case 'students':
          result.students.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(StudentModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$StudentModel extends StudentModel {
  @override
  final String name;
  @override
  final int level;
  @override
  final BuiltList<StudentModel> students;

  factory _$StudentModel([void Function(StudentModelBuilder)? updates]) =>
      (new StudentModelBuilder()..update(updates))._build();

  _$StudentModel._(
      {required this.name, required this.level, required this.students})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'StudentModel', 'name');
    BuiltValueNullFieldError.checkNotNull(level, r'StudentModel', 'level');
    BuiltValueNullFieldError.checkNotNull(
        students, r'StudentModel', 'students');
  }

  @override
  StudentModel rebuild(void Function(StudentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentModelBuilder toBuilder() => new StudentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentModel &&
        name == other.name &&
        level == other.level &&
        students == other.students;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, students.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentModel')
          ..add('name', name)
          ..add('level', level)
          ..add('students', students))
        .toString();
  }
}

class StudentModelBuilder
    implements Builder<StudentModel, StudentModelBuilder> {
  _$StudentModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  ListBuilder<StudentModel>? _students;
  ListBuilder<StudentModel> get students =>
      _$this._students ??= new ListBuilder<StudentModel>();
  set students(ListBuilder<StudentModel>? students) =>
      _$this._students = students;

  StudentModelBuilder();

  StudentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _level = $v.level;
      _students = $v.students.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentModel;
  }

  @override
  void update(void Function(StudentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentModel build() => _build();

  _$StudentModel _build() {
    _$StudentModel _$result;
    try {
      _$result = _$v ??
          new _$StudentModel._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'StudentModel', 'name'),
              level: BuiltValueNullFieldError.checkNotNull(
                  level, r'StudentModel', 'level'),
              students: students.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'students';
        students.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StudentModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
