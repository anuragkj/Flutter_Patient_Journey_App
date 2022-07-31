// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestsRecord> _$testsRecordSerializer = new _$TestsRecordSerializer();

class _$TestsRecordSerializer implements StructuredSerializer<TestsRecord> {
  @override
  final Iterable<Type> types = const [TestsRecord, _$TestsRecord];
  @override
  final String wireName = 'TestsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.appRef;
    if (value != null) {
      result
        ..add('app_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.floor;
    if (value != null) {
      result
        ..add('Floor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.source;
    if (value != null) {
      result
        ..add('Source')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destination;
    if (value != null) {
      result
        ..add('Destination')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderSeq;
    if (value != null) {
      result
        ..add('order_seq')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  TestsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'app_ref':
          result.appRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Floor':
          result.floor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order_seq':
          result.orderSeq = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$TestsRecord extends TestsRecord {
  @override
  final DocumentReference<Object> appRef;
  @override
  final String name;
  @override
  final String floor;
  @override
  final String source;
  @override
  final String destination;
  @override
  final int orderSeq;
  @override
  final DocumentReference<Object> reference;

  factory _$TestsRecord([void Function(TestsRecordBuilder) updates]) =>
      (new TestsRecordBuilder()..update(updates)).build();

  _$TestsRecord._(
      {this.appRef,
      this.name,
      this.floor,
      this.source,
      this.destination,
      this.orderSeq,
      this.reference})
      : super._();

  @override
  TestsRecord rebuild(void Function(TestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestsRecordBuilder toBuilder() => new TestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestsRecord &&
        appRef == other.appRef &&
        name == other.name &&
        floor == other.floor &&
        source == other.source &&
        destination == other.destination &&
        orderSeq == other.orderSeq &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, appRef.hashCode), name.hashCode),
                        floor.hashCode),
                    source.hashCode),
                destination.hashCode),
            orderSeq.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TestsRecord')
          ..add('appRef', appRef)
          ..add('name', name)
          ..add('floor', floor)
          ..add('source', source)
          ..add('destination', destination)
          ..add('orderSeq', orderSeq)
          ..add('reference', reference))
        .toString();
  }
}

class TestsRecordBuilder implements Builder<TestsRecord, TestsRecordBuilder> {
  _$TestsRecord _$v;

  DocumentReference<Object> _appRef;
  DocumentReference<Object> get appRef => _$this._appRef;
  set appRef(DocumentReference<Object> appRef) => _$this._appRef = appRef;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _floor;
  String get floor => _$this._floor;
  set floor(String floor) => _$this._floor = floor;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  String _destination;
  String get destination => _$this._destination;
  set destination(String destination) => _$this._destination = destination;

  int _orderSeq;
  int get orderSeq => _$this._orderSeq;
  set orderSeq(int orderSeq) => _$this._orderSeq = orderSeq;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TestsRecordBuilder() {
    TestsRecord._initializeBuilder(this);
  }

  TestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appRef = $v.appRef;
      _name = $v.name;
      _floor = $v.floor;
      _source = $v.source;
      _destination = $v.destination;
      _orderSeq = $v.orderSeq;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestsRecord;
  }

  @override
  void update(void Function(TestsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TestsRecord build() {
    final _$result = _$v ??
        new _$TestsRecord._(
            appRef: appRef,
            name: name,
            floor: floor,
            source: source,
            destination: destination,
            orderSeq: orderSeq,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
