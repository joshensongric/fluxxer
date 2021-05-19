import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'transaction_categories_record.g.dart';

abstract class TransactionCategoriesRecord
    implements
        Built<TransactionCategoriesRecord, TransactionCategoriesRecordBuilder> {
  static Serializer<TransactionCategoriesRecord> get serializer =>
      _$transactionCategoriesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionCategoriesRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction_categories');

  static Stream<TransactionCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionCategoriesRecord._();
  factory TransactionCategoriesRecord(
          [void Function(TransactionCategoriesRecordBuilder) updates]) =
      _$TransactionCategoriesRecord;
}

Map<String, dynamic> createTransactionCategoriesRecordData() =>
    serializers.serializeWith(TransactionCategoriesRecord.serializer,
        TransactionCategoriesRecord((t) => t));

TransactionCategoriesRecord get dummyTransactionCategoriesRecord {
  final builder = TransactionCategoriesRecordBuilder();
  return builder.build();
}

List<TransactionCategoriesRecord> createDummyTransactionCategoriesRecord(
        {int count}) =>
    List.generate(count, (_) => dummyTransactionCategoriesRecord);
