// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_address_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ParkingAddressRecord> _$parkingAddressRecordSerializer =
    new _$ParkingAddressRecordSerializer();

class _$ParkingAddressRecordSerializer
    implements StructuredSerializer<ParkingAddressRecord> {
  @override
  final Iterable<Type> types = const [
    ParkingAddressRecord,
    _$ParkingAddressRecord
  ];
  @override
  final String wireName = 'ParkingAddressRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ParkingAddressRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
  ParkingAddressRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParkingAddressRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ref':
          result.ref = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
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

class _$ParkingAddressRecord extends ParkingAddressRecord {
  @override
  final DocumentReference<Object> ref;
  @override
  final LatLng location;
  @override
  final DocumentReference<Object> reference;

  factory _$ParkingAddressRecord(
          [void Function(ParkingAddressRecordBuilder) updates]) =>
      (new ParkingAddressRecordBuilder()..update(updates)).build();

  _$ParkingAddressRecord._({this.ref, this.location, this.reference})
      : super._();

  @override
  ParkingAddressRecord rebuild(
          void Function(ParkingAddressRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParkingAddressRecordBuilder toBuilder() =>
      new ParkingAddressRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ParkingAddressRecord &&
        ref == other.ref &&
        location == other.location &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, ref.hashCode), location.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ParkingAddressRecord')
          ..add('ref', ref)
          ..add('location', location)
          ..add('reference', reference))
        .toString();
  }
}

class ParkingAddressRecordBuilder
    implements Builder<ParkingAddressRecord, ParkingAddressRecordBuilder> {
  _$ParkingAddressRecord _$v;

  DocumentReference<Object> _ref;
  DocumentReference<Object> get ref => _$this._ref;
  set ref(DocumentReference<Object> ref) => _$this._ref = ref;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ParkingAddressRecordBuilder() {
    ParkingAddressRecord._initializeBuilder(this);
  }

  ParkingAddressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ref = $v.ref;
      _location = $v.location;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ParkingAddressRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ParkingAddressRecord;
  }

  @override
  void update(void Function(ParkingAddressRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ParkingAddressRecord build() {
    final _$result = _$v ??
        new _$ParkingAddressRecord._(
            ref: ref, location: location, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
