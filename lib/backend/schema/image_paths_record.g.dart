// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_paths_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImagePathsRecord> _$imagePathsRecordSerializer =
    new _$ImagePathsRecordSerializer();

class _$ImagePathsRecordSerializer
    implements StructuredSerializer<ImagePathsRecord> {
  @override
  final Iterable<Type> types = const [ImagePathsRecord, _$ImagePathsRecord];
  @override
  final String wireName = 'ImagePathsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ImagePathsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.imageName;
    if (value != null) {
      result
        ..add('image_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ImagePathsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImagePathsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'image_name':
          result.imageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ImagePathsRecord extends ImagePathsRecord {
  @override
  final String imageName;
  @override
  final String url;
  @override
  final DocumentReference<Object> hospRef;
  @override
  final DocumentReference<Object> reference;

  factory _$ImagePathsRecord(
          [void Function(ImagePathsRecordBuilder) updates]) =>
      (new ImagePathsRecordBuilder()..update(updates)).build();

  _$ImagePathsRecord._({this.imageName, this.url, this.hospRef, this.reference})
      : super._();

  @override
  ImagePathsRecord rebuild(void Function(ImagePathsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImagePathsRecordBuilder toBuilder() =>
      new ImagePathsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImagePathsRecord &&
        imageName == other.imageName &&
        url == other.url &&
        hospRef == other.hospRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, imageName.hashCode), url.hashCode), hospRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImagePathsRecord')
          ..add('imageName', imageName)
          ..add('url', url)
          ..add('hospRef', hospRef)
          ..add('reference', reference))
        .toString();
  }
}

class ImagePathsRecordBuilder
    implements Builder<ImagePathsRecord, ImagePathsRecordBuilder> {
  _$ImagePathsRecord _$v;

  String _imageName;
  String get imageName => _$this._imageName;
  set imageName(String imageName) => _$this._imageName = imageName;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  DocumentReference<Object> _hospRef;
  DocumentReference<Object> get hospRef => _$this._hospRef;
  set hospRef(DocumentReference<Object> hospRef) => _$this._hospRef = hospRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ImagePathsRecordBuilder() {
    ImagePathsRecord._initializeBuilder(this);
  }

  ImagePathsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageName = $v.imageName;
      _url = $v.url;
      _hospRef = $v.hospRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImagePathsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImagePathsRecord;
  }

  @override
  void update(void Function(ImagePathsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImagePathsRecord build() {
    final _$result = _$v ??
        new _$ImagePathsRecord._(
            imageName: imageName,
            url: url,
            hospRef: hospRef,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
