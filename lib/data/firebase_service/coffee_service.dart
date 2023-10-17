import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeelito/data/models/product/product_model.dart';
import 'package:coffeelito/data/models/universal_data.dart';


class CoffeeService {
  Future<UniversalData> addProduct({required CoffeeModel coffeeModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection("coffee")
          .add(coffeeModel.toJson());

      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(newProduct.id)
          .update({
        "productId": newProduct.id,
      });

      return UniversalData(data: "Coffee added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateProduct(
      {required CoffeeModel coffeeModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(coffeeModel.coffeeId)
          .update(coffeeModel.toJson());

      return UniversalData(data: "Coffee updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteProduct({required String coffeeId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(coffeeId)
          .delete();

      return UniversalData(data: "Coffee deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getAllProducts() async {
    try {
      FirebaseFirestore.instance.collection("coffee").snapshots().map(
              (event) => event.docs
              .map((doc) => CoffeeModel.fromJson(doc.data()))
              .toList());
      return UniversalData(data: "Coffee fetched!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}