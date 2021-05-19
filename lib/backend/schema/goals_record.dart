import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'goals_record.g.dart';

abstract class GoalsRecord implements Built<GoalsRecord, GoalsRecordBuilder> {
  static Serializer<GoalsRecord> get serializer => _$goalsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'goal_name')
  String get goalName;

  @nullable
  BuiltList<DocumentReference> get steps;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GoalsRecordBuilder builder) => builder
    ..goalName = ''
    ..steps = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goals');

  static Stream<GoalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GoalsRecord._();
  factory GoalsRecord([void Function(GoalsRecordBuilder) updates]) =
      _$GoalsRecord;
}

Map<String, dynamic> createGoalsRecordData({
  String goalName,
}) =>
    serializers.serializeWith(
        GoalsRecord.serializer,
        GoalsRecord((g) => g
          ..goalName = goalName
          ..steps = null));

GoalsRecord get dummyGoalsRecord {
  final builder = GoalsRecordBuilder()..goalName = dummyString;
  return builder.build();
}

List<GoalsRecord> createDummyGoalsRecord({int count}) =>
    List.generate(count, (_) => dummyGoalsRecord);
