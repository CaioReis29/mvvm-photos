
import 'package:dio/dio.dart';
import 'package:mvvm_example/core/constants/api_endpoints.dart';
import 'package:mvvm_example/dtos/photo_dto.dart';

class PhotoRepository {
  final Dio dio;

  PhotoRepository({required this.dio});

  final path = "${ApiEndpoints.baseUrl}/photos";

  Future<List<PhotoDto>> getPhotos() async {
    try {
      final response = await dio.get(path);

      if(response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<PhotoDto> photoResponse = data.map((photo) {
          return PhotoDto.fromJson(photo);
        }).toList();

        return photoResponse;

      } else {
        throw Exception();
      }

    } catch (e) {
      rethrow;
    }
  }
}