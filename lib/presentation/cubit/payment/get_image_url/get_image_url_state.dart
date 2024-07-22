// ignore_for_file: overridden_fields, annotate_overrides

part of 'get_image_url_cubit.dart';

abstract class GetImageUrlState extends Equatable {
  final String? message;

  const GetImageUrlState(this.message);

  @override
  List<Object?> get props => [message];
}

class GetImageUrlInitial extends GetImageUrlState {
  const GetImageUrlInitial() : super(null);
}

class GetImageUrlLoading extends GetImageUrlState {
  const GetImageUrlLoading() : super(null);
}

class GetImageUrlLoaded extends GetImageUrlState {
  final String? data;

  const GetImageUrlLoaded({
    required this.data,
  }) : super(null);

  @override
  List<Object?> get props => [data, message];
}

class GetImageUrlNotLoaded extends GetImageUrlState {
  final String message;

  const GetImageUrlNotLoaded({
    required this.message,
  }) : super(message);

  @override
  List<Object?> get props => [message];
}
