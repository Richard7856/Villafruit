import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemselecionadoRecord extends FirestoreRecord {
  ItemselecionadoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "cart" field.
  DocumentReference? _cart;
  DocumentReference? get cart => _cart;
  bool hasCart() => _cart != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "qtymaduro" field.
  int? _qtymaduro;
  int get qtymaduro => _qtymaduro ?? 0;
  bool hasQtymaduro() => _qtymaduro != null;

  // "qtyverde" field.
  int? _qtyverde;
  int get qtyverde => _qtyverde ?? 0;
  bool hasQtyverde() => _qtyverde != null;

  // "qtymedio" field.
  int? _qtymedio;
  int get qtymedio => _qtymedio ?? 0;
  bool hasQtymedio() => _qtymedio != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _item = snapshotData['item'] as DocumentReference?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _image = snapshotData['image'] as String?;
    _cart = snapshotData['cart'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _qtymaduro = castToType<int>(snapshotData['qtymaduro']);
    _qtyverde = castToType<int>(snapshotData['qtyverde']);
    _qtymedio = castToType<int>(snapshotData['qtymedio']);
    _creator = snapshotData['creator'] as DocumentReference?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itemselecionado');

  static Stream<ItemselecionadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemselecionadoRecord.fromSnapshot(s));

  static Future<ItemselecionadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemselecionadoRecord.fromSnapshot(s));

  static ItemselecionadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemselecionadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemselecionadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemselecionadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemselecionadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemselecionadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemselecionadoRecordData({
  String? name,
  double? price,
  int? quantity,
  DocumentReference? item,
  double? subtotal,
  String? image,
  DocumentReference? cart,
  String? description,
  int? qtymaduro,
  int? qtyverde,
  int? qtymedio,
  DocumentReference? creator,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
      'item': item,
      'subtotal': subtotal,
      'image': image,
      'cart': cart,
      'description': description,
      'qtymaduro': qtymaduro,
      'qtyverde': qtyverde,
      'qtymedio': qtymedio,
      'creator': creator,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}
