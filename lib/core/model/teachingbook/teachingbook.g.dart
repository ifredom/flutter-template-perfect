// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachingbook.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Teachingbook> _$teachingbookSerializer =
    new _$TeachingbookSerializer();

class _$TeachingbookSerializer implements StructuredSerializer<Teachingbook> {
  @override
  final Iterable<Type> types = const [Teachingbook, _$Teachingbook];
  @override
  final String wireName = 'Teachingbook';

  @override
  Iterable<Object> serialize(Serializers serializers, Teachingbook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.bookName != null) {
      result
        ..add('bookName')
        ..add(serializers.serialize(object.bookName,
            specifiedType: const FullType(String)));
    }
    if (object.publisherCode != null) {
      result
        ..add('publisherCode')
        ..add(serializers.serialize(object.publisherCode,
            specifiedType: const FullType(String)));
    }
    if (object.publisherName != null) {
      result
        ..add('publisherName')
        ..add(serializers.serialize(object.publisherName,
            specifiedType: const FullType(String)));
    }
    if (object.orderNo != null) {
      result
        ..add('orderNo')
        ..add(serializers.serialize(object.orderNo,
            specifiedType: const FullType(int)));
    }
    if (object.coverImageId != null) {
      result
        ..add('coverImageId')
        ..add(serializers.serialize(object.coverImageId,
            specifiedType: const FullType(String)));
    }
    if (object.validFlag != null) {
      result
        ..add('validFlag')
        ..add(serializers.serialize(object.validFlag,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Teachingbook deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeachingbookBuilder();

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
        case 'bookName':
          result.bookName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publisherCode':
          result.publisherCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publisherName':
          result.publisherName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderNo':
          result.orderNo = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'coverImageId':
          result.coverImageId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'validFlag':
          result.validFlag = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Teachingbook extends Teachingbook {
  @override
  final String id;
  @override
  final String bookName;
  @override
  final String publisherCode;
  @override
  final String publisherName;
  @override
  final int orderNo;
  @override
  final String coverImageId;
  @override
  final int validFlag;

  factory _$Teachingbook([void Function(TeachingbookBuilder) updates]) =>
      (new TeachingbookBuilder()..update(updates)).build();

  _$Teachingbook._(
      {this.id,
      this.bookName,
      this.publisherCode,
      this.publisherName,
      this.orderNo,
      this.coverImageId,
      this.validFlag})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Teachingbook', 'id');
    }
  }

  @override
  Teachingbook rebuild(void Function(TeachingbookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeachingbookBuilder toBuilder() => new TeachingbookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Teachingbook &&
        id == other.id &&
        bookName == other.bookName &&
        publisherCode == other.publisherCode &&
        publisherName == other.publisherName &&
        orderNo == other.orderNo &&
        coverImageId == other.coverImageId &&
        validFlag == other.validFlag;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), bookName.hashCode),
                        publisherCode.hashCode),
                    publisherName.hashCode),
                orderNo.hashCode),
            coverImageId.hashCode),
        validFlag.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Teachingbook')
          ..add('id', id)
          ..add('bookName', bookName)
          ..add('publisherCode', publisherCode)
          ..add('publisherName', publisherName)
          ..add('orderNo', orderNo)
          ..add('coverImageId', coverImageId)
          ..add('validFlag', validFlag))
        .toString();
  }
}

class TeachingbookBuilder
    implements Builder<Teachingbook, TeachingbookBuilder> {
  _$Teachingbook _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _bookName;
  String get bookName => _$this._bookName;
  set bookName(String bookName) => _$this._bookName = bookName;

  String _publisherCode;
  String get publisherCode => _$this._publisherCode;
  set publisherCode(String publisherCode) =>
      _$this._publisherCode = publisherCode;

  String _publisherName;
  String get publisherName => _$this._publisherName;
  set publisherName(String publisherName) =>
      _$this._publisherName = publisherName;

  int _orderNo;
  int get orderNo => _$this._orderNo;
  set orderNo(int orderNo) => _$this._orderNo = orderNo;

  String _coverImageId;
  String get coverImageId => _$this._coverImageId;
  set coverImageId(String coverImageId) => _$this._coverImageId = coverImageId;

  int _validFlag;
  int get validFlag => _$this._validFlag;
  set validFlag(int validFlag) => _$this._validFlag = validFlag;

  TeachingbookBuilder();

  TeachingbookBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _bookName = _$v.bookName;
      _publisherCode = _$v.publisherCode;
      _publisherName = _$v.publisherName;
      _orderNo = _$v.orderNo;
      _coverImageId = _$v.coverImageId;
      _validFlag = _$v.validFlag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Teachingbook other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Teachingbook;
  }

  @override
  void update(void Function(TeachingbookBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Teachingbook build() {
    final _$result = _$v ??
        new _$Teachingbook._(
            id: id,
            bookName: bookName,
            publisherCode: publisherCode,
            publisherName: publisherName,
            orderNo: orderNo,
            coverImageId: coverImageId,
            validFlag: validFlag);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
