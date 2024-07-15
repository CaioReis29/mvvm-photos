
import 'package:flutter/material.dart';
import 'package:mvvm_example/repositories/photo_repository.dart';
import 'package:mvvm_example/viewmodels/photo_state.dart';

class PhotoScreenViewmodel {
  final PhotoRepository repository;

  PhotoScreenViewmodel({required this.repository});

  var state = ValueNotifier<PhotoState>(InitialPhoto());

  void getPhotos() async {
    state.value = LoadingPhoto();
    
    try {
      final photos = await repository.getPhotos();

      state.value = SuccessPhoto(photos: photos);
    } catch (exception, stackTrace) {
      state.value = ErrorPhoto(exception, stackTrace);
    }
  }

}