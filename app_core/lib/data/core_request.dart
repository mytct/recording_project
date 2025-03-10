import 'package:equatable/equatable.dart';

enum HttpMethod { get, post, put, delete, patch, upload }

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
