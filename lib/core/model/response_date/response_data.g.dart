// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseData> _$responseDataSerializer =
    new _$ResponseDataSerializer();

class _$ResponseDataSerializer implements StructuredSerializer<ResponseData> {
  @override
  final Iterable<Type> types = const [ResponseData, _$ResponseData];
  @override
  final String wireName = 'ResponseData';

  @override
  Iterable<Object> serialize(Serializers serializers, ResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(int)));
    }
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
            specifiedType: const FullType(String)));
    }
    if (object.msg != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(object.msg,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ResponseData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseData extends ResponseData {
  @override
  final int code;
  @override
  final String data;
  @override
  final String msg;

  factory _$ResponseData([void Function(ResponseDataBuilder) updates]) =>
      (new ResponseDataBuilder()..update(updates)).build();

  _$ResponseData._({this.code, this.data, this.msg}) : super._();

  @override
  ResponseData rebuild(void Function(ResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseDataBuilder toBuilder() => new ResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseData &&
        code == other.code &&
        data == other.data &&
        msg == other.msg;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, code.hashCode), data.hashCode), msg.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResponseData')
          ..add('code', code)
          ..add('data', data)
          ..add('msg', msg))
        .toString();
  }
}

class ResponseDataBuilder
    implements Builder<ResponseData, ResponseDataBuilder> {
  _$ResponseData _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  ResponseDataBuilder();

  ResponseDataBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _data = _$v.data;
      _msg = _$v.msg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResponseData;
  }

  @override
  void update(void Function(ResponseDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResponseData build() {
    final _$result =
        _$v ?? new _$ResponseData._(code: code, data: data, msg: msg);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
