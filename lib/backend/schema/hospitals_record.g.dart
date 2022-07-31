// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospitals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HospitalsRecord> _$hospitalsRecordSerializer =
    new _$HospitalsRecordSerializer();

class _$HospitalsRecordSerializer
    implements StructuredSerializer<HospitalsRecord> {
  @override
  final Iterable<Type> types = const [HospitalsRecord, _$HospitalsRecord];
  @override
  final String wireName = 'HospitalsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, HospitalsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactNumber;
    if (value != null) {
      result
        ..add('contact_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parkingLocation;
    if (value != null) {
      result
        ..add('parking_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.valetLocation;
    if (value != null) {
      result
        ..add('valet_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.locationMapping;
    if (value != null) {
      result
        ..add('location_mapping')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.floorsMapping;
    if (value != null) {
      result
        ..add('floors_mapping')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.gmapParking;
    if (value != null) {
      result
        ..add('gmap_parking')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gmapValet;
    if (value != null) {
      result
        ..add('gmap_valet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  HospitalsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HospitalsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_number':
          result.contactNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parking_location':
          result.parkingLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'valet_location':
          result.valetLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'location_mapping':
          result.locationMapping.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'floors_mapping':
          result.floorsMapping.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'gmap_parking':
          result.gmapParking = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gmap_valet':
          result.gmapValet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$HospitalsRecord extends HospitalsRecord {
  @override
  final String name;
  @override
  final String contactNumber;
  @override
  final LatLng parkingLocation;
  @override
  final LatLng valetLocation;
  @override
  final BuiltList<String> locationMapping;
  @override
  final BuiltList<String> floorsMapping;
  @override
  final String gmapParking;
  @override
  final String gmapValet;
  @override
  final DocumentReference<Object> reference;

  factory _$HospitalsRecord([void Function(HospitalsRecordBuilder) updates]) =>
      (new HospitalsRecordBuilder()..update(updates)).build();

  _$HospitalsRecord._(
      {this.name,
      this.contactNumber,
      this.parkingLocation,
      this.valetLocation,
      this.locationMapping,
      this.floorsMapping,
      this.gmapParking,
      this.gmapValet,
      this.reference})
      : super._();

  @override
  HospitalsRecord rebuild(void Function(HospitalsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HospitalsRecordBuilder toBuilder() =>
      new HospitalsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HospitalsRecord &&
        name == other.name &&
        contactNumber == other.contactNumber &&
        parkingLocation == other.parkingLocation &&
        valetLocation == other.valetLocation &&
        locationMapping == other.locationMapping &&
        floorsMapping == other.floorsMapping &&
        gmapParking == other.gmapParking &&
        gmapValet == other.gmapValet &&
        reference == other.reference;
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
                                $jc($jc(0, name.hashCode),
                                    contactNumber.hashCode),
                                parkingLocation.hashCode),
                            valetLocation.hashCode),
                        locationMapping.hashCode),
                    floorsMapping.hashCode),
                gmapParking.hashCode),
            gmapValet.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HospitalsRecord')
          ..add('name', name)
          ..add('contactNumber', contactNumber)
          ..add('parkingLocation', parkingLocation)
          ..add('valetLocation', valetLocation)
          ..add('locationMapping', locationMapping)
          ..add('floorsMapping', floorsMapping)
          ..add('gmapParking', gmapParking)
          ..add('gmapValet', gmapValet)
          ..add('reference', reference))
        .toString();
  }
}

class HospitalsRecordBuilder
    implements Builder<HospitalsRecord, HospitalsRecordBuilder> {
  _$HospitalsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _contactNumber;
  String get contactNumber => _$this._contactNumber;
  set contactNumber(String contactNumber) =>
      _$this._contactNumber = contactNumber;

  LatLng _parkingLocation;
  LatLng get parkingLocation => _$this._parkingLocation;
  set parkingLocation(LatLng parkingLocation) =>
      _$this._parkingLocation = parkingLocation;

  LatLng _valetLocation;
  LatLng get valetLocation => _$this._valetLocation;
  set valetLocation(LatLng valetLocation) =>
      _$this._valetLocation = valetLocation;

  ListBuilder<String> _locationMapping;
  ListBuilder<String> get locationMapping =>
      _$this._locationMapping ??= new ListBuilder<String>();
  set locationMapping(ListBuilder<String> locationMapping) =>
      _$this._locationMapping = locationMapping;

  ListBuilder<String> _floorsMapping;
  ListBuilder<String> get floorsMapping =>
      _$this._floorsMapping ??= new ListBuilder<String>();
  set floorsMapping(ListBuilder<String> floorsMapping) =>
      _$this._floorsMapping = floorsMapping;

  String _gmapParking;
  String get gmapParking => _$this._gmapParking;
  set gmapParking(String gmapParking) => _$this._gmapParking = gmapParking;

  String _gmapValet;
  String get gmapValet => _$this._gmapValet;
  set gmapValet(String gmapValet) => _$this._gmapValet = gmapValet;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HospitalsRecordBuilder() {
    HospitalsRecord._initializeBuilder(this);
  }

  HospitalsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _contactNumber = $v.contactNumber;
      _parkingLocation = $v.parkingLocation;
      _valetLocation = $v.valetLocation;
      _locationMapping = $v.locationMapping?.toBuilder();
      _floorsMapping = $v.floorsMapping?.toBuilder();
      _gmapParking = $v.gmapParking;
      _gmapValet = $v.gmapValet;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HospitalsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HospitalsRecord;
  }

  @override
  void update(void Function(HospitalsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HospitalsRecord build() {
    _$HospitalsRecord _$result;
    try {
      _$result = _$v ??
          new _$HospitalsRecord._(
              name: name,
              contactNumber: contactNumber,
              parkingLocation: parkingLocation,
              valetLocation: valetLocation,
              locationMapping: _locationMapping?.build(),
              floorsMapping: _floorsMapping?.build(),
              gmapParking: gmapParking,
              gmapValet: gmapValet,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'locationMapping';
        _locationMapping?.build();
        _$failedField = 'floorsMapping';
        _floorsMapping?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HospitalsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
