import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'steps_record.g.dart';

abstract class StepsRecord implements Built<StepsRecord, StepsRecordBuilder> {
  static Serializer<StepsRecord> get serializer => _$stepsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'step_name')
  String get stepName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StepsRecordBuilder builder) =>
      builder..stepName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('steps');

  static Stream<StepsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StepsRecord._();
  factory StepsRecord([void Function(StepsRecordBuilder) updates]) =
      _$StepsRecord;
}

Map<String, dynamic> createStepsRecordData({
  String stepName,
}) =>
    serializers.serializeWith(
        StepsRecord.serializer, StepsRecord((s) => s..stepName = stepName));

StepsRecord get dummyStepsRecord {
  final builder = StepsRecordBuilder()..stepName = dummyString;
  return builder.build();
}

List<StepsRecord> createDummyStepsRecord({int count}) =>
    List.generate(count, (_) => dummyStepsRecord);
