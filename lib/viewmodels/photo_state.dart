import 'package:mvvm_example/dtos/photo_dto.dart';

abstract class PhotoState {}

final class InitialPhoto extends PhotoState{}

final class LoadingPhoto extends PhotoState{}

final class SuccessPhoto extends PhotoState{
  final List<PhotoDto> photos;

  SuccessPhoto({required this.photos});
}

final class ErrorPhoto extends PhotoState{
  Object? exception;
  Object? stackTrace;

  ErrorPhoto(this.exception, this.stackTrace);
}