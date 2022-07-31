// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppointmentsRecord> _$appointmentsRecordSerializer =
    new _$AppointmentsRecordSerializer();

class _$AppointmentsRecordSerializer
    implements StructuredSerializer<AppointmentsRecord> {
  @override
  final Iterable<Type> types = const [AppointmentsRecord, _$AppointmentsRecord];
  @override
  final String wireName = 'AppointmentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AppointmentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.patientRef;
    if (value != null) {
      result
        ..add('patient_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.tokenNum;
    if (value != null) {
      result
        ..add('token_num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctor;
    if (value != null) {
      result
        ..add('doctor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valet;
    if (value != null) {
      result
        ..add('valet')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.patientName;
    if (value != null) {
      result
        ..add('patient_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dateTime;
    if (value != null) {
      result
        ..add('date_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  AppointmentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppointmentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'patient_ref':
          result.patientRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'token_num':
          result.tokenNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'doctor':
          result.doctor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'valet':
          result.valet = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'patient_name':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'date_time':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$AppointmentsRecord extends AppointmentsRecord {
  @override
  final DocumentReference<Object> patientRef;
  @override
  final String tokenNum;
  @override
  final String doctor;
  @override
  final bool valet;
  @override
  final DocumentReference<Object> location;
  @override
  final String patientName;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DateTime dateTime;
  @override
  final String type;
  @override
  final DocumentReference<Object> reference;

  factory _$AppointmentsRecord(
          [void Function(AppointmentsRecordBuilder) updates]) =>
      (new AppointmentsRecordBuilder()..update(updates)).build();

  _$AppointmentsRecord._(
      {this.patientRef,
      this.tokenNum,
      this.doctor,
      this.valet,
      this.location,
      this.patientName,
      this.userRef,
      this.dateTime,
      this.type,
      this.reference})
      : super._();

  @override
  AppointmentsRecord rebuild(
          void Function(AppointmentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppointmentsRecordBuilder toBuilder() =>
      new AppointmentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppointmentsRecord &&
        patientRef == other.patientRef &&
        tokenNum == other.tokenNum &&
        doctor == other.doctor &&
        valet == other.valet &&
        location == other.location &&
        patientName == other.patientName &&
        userRef == other.userRef &&
        dateTime == other.dateTime &&
        type == other.type &&
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
                                $jc(
                                    $jc($jc(0, patientRef.hashCode),
                                        tokenNum.hashCode),
                                    doctor.hashCode),
                                valet.hashCode),
                            location.hashCode),
                        patientName.hashCode),
                    userRef.hashCode),
                dateTime.hashCode),
            type.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppointmentsRecord')
          ..add('patientRef', patientRef)
          ..add('tokenNum', tokenNum)
          ..add('doctor', doctor)
          ..add('valet', valet)
          ..add('location', location)
          ..add('patientName', patientName)
          ..add('userRef', userRef)
          ..add('dateTime', dateTime)
          ..add('type', type)
          ..add('reference', reference))
        .toString();
  }
}

class AppointmentsRecordBuilder
    implements Builder<AppointmentsRecord, AppointmentsRecordBuilder> {
  _$AppointmentsRecord _$v;

  DocumentReference<Object> _patientRef;
  DocumentReference<Object> get patientRef => _$this._patientRef;
  set patientRef(DocumentReference<Object> patientRef) =>
      _$this._patientRef = patientRef;

  String _tokenNum;
  String get tokenNum => _$this._tokenNum;
  set tokenNum(String tokenNum) => _$this._tokenNum = tokenNum;

  String _doctor;
  String get doctor => _$this._doctor;
  set doctor(String doctor) => _$this._doctor = doctor;

  bool _valet;
  bool get valet => _$this._valet;
  set valet(bool valet) => _$this._valet = valet;

  DocumentReference<Object> _location;
  DocumentReference<Object> get location => _$this._location;
  set location(DocumentReference<Object> location) =>
      _$this._location = location;

  String _patientName;
  String get patientName => _$this._patientName;
  set patientName(String patientName) => _$this._patientName = patientName;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DateTime _dateTime;
  DateTime get dateTime => _$this._dateTime;
  set dateTime(DateTime dateTime) => _$this._dateTime = dateTime;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AppointmentsRecordBuilder() {
    AppointmentsRecord._initializeBuilder(this);
  }

  AppointmentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _patientRef = $v.patientRef;
      _tokenNum = $v.tokenNum;
      _doctor = $v.doctor;
      _valet = $v.valet;
      _location = $v.location;
      _patientName = $v.patientName;
      _userRef = $v.userRef;
      _dateTime = $v.dateTime;
      _type = $v.type;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppointmentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppointmentsRecord;
  }

  @override
  void update(void Function(AppointmentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppointmentsRecord build() {
    final _$result = _$v ??
        new _$AppointmentsRecord._(
            patientRef: patientRef,
            tokenNum: tokenNum,
            doctor: doctor,
            valet: valet,
            location: location,
            patientName: patientName,
            userRef: userRef,
            dateTime: dateTime,
            type: type,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
