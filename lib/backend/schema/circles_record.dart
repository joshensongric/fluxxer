import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'circles_record.g.dart';

abstract class CirclesRecord
    implements Built<CirclesRecord, CirclesRecordBuilder> {
  static Serializer<CirclesRecord> get serializer => _$circlesRecordSerializer;

  @nullable
  String get name;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  BuiltList<DocumentReference> get transactions;

  @nullable
  String get picture;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CirclesRecordBuilder builder) => builder
    ..name = ''
    ..users = ListBuilder()
    ..transactions = ListBuilder()
    ..picture = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('circles');

  static Stream<CirclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CirclesRecord._();
  factory CirclesRecord([void Function(CirclesRecordBuilder) updates]) =
      _$CirclesRecord;
}

Map<String, dynamic> createCirclesRecordData({
  String name,
  String picture,
}) =>
    serializers.serializeWith(
        CirclesRecord.serializer,
        CirclesRecord((c) => c
          ..name = name
          ..users = null
          ..transactions = null
          ..picture = picture));

CirclesRecord get dummyCirclesRecord {
  final builder = CirclesRecordBuilder()
    ..name = dummyString
    ..picture = dummyImagePath;
  return builder.build();
}

List<CirclesRecord> createDummyCirclesRecord({int count}) =>
    List.generate(count, (_) => dummyCirclesRecord);
