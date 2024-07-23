// ignore_for_file: overridden_fields, annotate_overrides

part of 'upload_image_cubit.dart';

abstract class UploadImageState extends Equatable {
  final String? message;

  const UploadImageState({this.message});

  @override
  List<Object?> get props => [message];
}

final class UploadImageInitial extends UploadImageState {}

final class UploadImageLoading extends UploadImageState {}

final class UploadImageSuccess extends UploadImageState {}

final class UploadImageFailed extends UploadImageState {
  final String message;

  const UploadImageFailed({required this.message}) : super(message: message);

  @override
  List<Object> get props => [message];
}
