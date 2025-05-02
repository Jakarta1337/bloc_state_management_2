part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<dynamic> post;

  const PostLoaded({required this.post});

  @override
  List<Object> get props => [post];
}

class PostError extends PostState {
  final String error;

  const PostError({required this.error});

  @override
  List<Object> get props => [error];
}
