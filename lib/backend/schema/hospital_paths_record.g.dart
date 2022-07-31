// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_paths_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HospitalPathsRecord> _$hospitalPathsRecordSerializer =
    new _$HospitalPathsRecordSerializer();

class _$HospitalPathsRecordSerializer
    implements StructuredSerializer<HospitalPathsRecord> {
  @override
  final Iterable<Type> types = const [
    HospitalPathsRecord,
    _$HospitalPathsRecord
  ];
  @override
  final String wireName = 'HospitalPathsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, HospitalPathsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.pathName;
    if (value != null) {
      result
        ..add('path_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.directions;
    if (value != null) {
      result
        ..add('directions')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.hospRef;
    if (value != null) {
      result
        ..add('hospRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  HospitalPathsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HospitalPathsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'path_name':
          result.pathName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'directions':
          result.directions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'hospRef':
          result.hospRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$HospitalPathsRecord extends HospitalPathsRecord {
  @override
  final String pathName;
  @override
  final BuiltList<String> directions;
  @override
  final DocumentReference<Object> hospRef;
  @override
  final DocumentReference<Object> reference;

  factory _$HospitalPathsRecord(
          [void Function(HospitalPathsRecordBuilder) updates]) =>
      (new HospitalPathsRecordBuilder()..update(updates)).build();

  _$HospitalPathsRecord._(
      {this.pathName, this.directions, this.hospRef, this.reference})
      : super._();

  @override
  HospitalPathsRecord rebuild(
          void Function(HospitalPathsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HospitalPathsRecordBuilder toBuilder() =>
      new HospitalPathsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HospitalPathsRecord &&
        pathName == other.pathName &&
        directions == other.directions &&
        hospRef == other.hospRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, pathName.hashCode), directions.hashCode),
            hospRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HospitalPathsRecord')
          ..add('pathName', pathName)
          ..add('directions', directions)
          ..add('hospRef', hospRef)
          ..add('reference', reference))
        .toString();
  }
}

class HospitalPathsRecordBuilder
    implements Builder<HospitalPathsRecord, HospitalPathsRecordBuilder> {
  _$HospitalPathsRecord _$v;

  String _pathName;
  String get pathName => _$this._pathName;
  set pathName(String pathName) => _$this._pathName = pathName;

  ListBuilder<String> _directions;
  ListBuilder<String> get directions =>
      _$this._directions ??= new ListBuilder<String>();
  set directions(ListBuilder<String> directions) =>
      _$this._directions = directions;

  DocumentReference<Object> _hospRef;
  DocumentReference<Object> get hospRef => _$this._hospRef;
  set hospRef(DocumentReference<Object> hospRef) => _$this._hospRef = hospRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HospitalPathsRecordBuilder() {
    HospitalPathsRecord._initializeBuilder(this);
  }

  HospitalPathsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pathName = $v.pathName;
      _directions = $v.directions?.toBuilder();
      _hospRef = $v.hospRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HospitalPathsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HospitalPathsRecord;
  }

  @override
  void update(void Function(HospitalPathsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HospitalPathsRecord build() {
    _$HospitalPathsRecord _$result;
    try {
      _$result = _$v ??
          new _$HospitalPathsRecord._(
              pathName: pathName,
              directions: _directions?.build(),
              hospRef: hospRef,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'directions';
        _directions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HospitalPathsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
