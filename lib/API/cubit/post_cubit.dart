import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading());

  Future<void> fetchPosts() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

    emit(PostLoading());

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List posts = json.decode(response.body);
        emit(PostLoaded(post: posts));
      }
    } catch (e) {
      PostError(error: "ERROR $e");
    }
  }
}
