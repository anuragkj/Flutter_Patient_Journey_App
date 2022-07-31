// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PatientsRecord> _$patientsRecordSerializer =
    new _$PatientsRecordSerializer();

class _$PatientsRecordSerializer
    implements StructuredSerializer<PatientsRecord> {
  @override
  final Iterable<Type> types = const [PatientsRecord, _$PatientsRecord];
  @override
  final String wireName = 'PatientsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PatientsRecord object,
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
    value = object.passport;
    if (value != null) {
      result
        ..add('passport')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isMainUser;
    if (value != null) {
      result
        ..add('is_main_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
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
  PatientsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientsRecordBuilder();

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
        case 'passport':
          result.passport = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_main_user':
          result.isMainUser = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
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

class _$PatientsRecord extends PatientsRecord {
  @override
  final String name;
  @override
  final String passport;
  @override
  final bool isMainUser;
  @override
  final DocumentReference<Object> ref;
  @override
  final DocumentReference<Object> reference;

  factory _$PatientsRecord([void Function(PatientsRecordBuilder) updates]) =>
      (new PatientsRecordBuilder()..update(updates)).build();

  _$PatientsRecord._(
      {this.name, this.passport, this.isMainUser, this.ref, this.reference})
      : super._();

  @override
  PatientsRecord rebuild(void Function(PatientsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientsRecordBuilder toBuilder() =>
      new PatientsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientsRecord &&
        name == other.name &&
        passport == other.passport &&
        isMainUser == other.isMainUser &&
        ref == other.ref &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), passport.hashCode),
                isMainUser.hashCode),
            ref.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PatientsRecord')
          ..add('name', name)
          ..add('passport', passport)
          ..add('isMainUser', isMainUser)
          ..add('ref', ref)
          ..add('reference', reference))
        .toString();
  }
}

class PatientsRecordBuilder
    implements Builder<PatientsRecord, PatientsRecordBuilder> {
  _$PatientsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _passport;
  String get passport => _$this._passport;
  set passport(String passport) => _$this._passport = passport;

  bool _isMainUser;
  bool get isMainUser => _$this._isMainUser;
  set isMainUser(bool isMainUser) => _$this._isMainUser = isMainUser;

  DocumentReference<Object> _ref;
  DocumentReference<Object> get ref => _$this._ref;
  set ref(DocumentReference<Object> ref) => _$this._ref = ref;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PatientsRecordBuilder() {
    PatientsRecord._initializeBuilder(this);
  }

  PatientsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _passport = $v.passport;
      _isMainUser = $v.isMainUser;
      _ref = $v.ref;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientsRecord;
  }

  @override
  void update(void Function(PatientsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PatientsRecord build() {
    final _$result = _$v ??
        new _$PatientsRecord._(
            name: name,
            passport: passport,
            isMainUser: isMainUser,
            ref: ref,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
