import 'dart:io';

import 'package:breaking_news/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future saveUserData(UserModel user) async {
    try {
      print("user id :${user.uid}");
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } catch (error) {
      debugPrint('Error saving user data: $error');

      throw Exception("Error while saving data to the database $error");
    }
  }

  Future getUserData(String userId) async {
    try {
      final documentSnapshot =
          await _firestore.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        return UserModel.fromJson(documentSnapshot.data() ?? {});
      } else {
        return {}; // Return empty map if user doesn't exist
      }
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Error getting user data: $error');
      //print('Error getting user data: $error');
      //return {}; // Return empty map on error
    }
  }

  Future updataUserData(
      {required String userId,
      required String field,
      required dynamic data}) async {
    print("userId $userId");

    try {
      await _firestore
          .collection("users")
          .doc(userId)
          .update({field: data}).then((value) => debugPrint("Updated data"));
    } catch (error) {
      throw Exception('Failed to update user data');
    }
  }

  Future<String> uploadImage({required String userId, required XFile image}) async {
    try {
      final storage = FirebaseStorage.instance;
      final imageName = '$userId.jpg';
      final reference = storage.ref().child('profile_pictures/$imageName');
      final uploadTask = reference.putFile(File(image.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      await updataUserData(userId: userId, field: "imageUrl", data: url);
      return url.toString();
    } catch (error) {
      print("error yad");
      throw Exception("Faild to Upload Image");
    }
  }
  

  /* Future deleteHistoryItem(String userID, List data) async {
    try {
      await _firestore.collection("users").doc(userID).set(
          {"history": data}).then((value) => debugPrint("delete history item"));
    } catch (error) {
      throw Exception("Faild to delete history item");
    }
  } */
}
