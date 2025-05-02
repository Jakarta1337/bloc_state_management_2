import 'package:bloc_state_management_2/API/bloc/post_bloc.dart';
// import 'package:bloc_state_management_2/API/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class APIPage extends StatefulWidget {
  const APIPage({super.key});

  @override
  State<APIPage> createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  @override
  void initState() {
    // context.read<PostCubit>().fetchPosts();
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<PostCubit, PostState>(
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.post.length,
            itemBuilder: (context, index) {
              final post = state.post[index];
              return ListTile(
                subtitle: Text(post["title"]),
                title: Text("${post["id"]}"),
              );
            },
          );
        } else if (state is PostError) {
          return InkWell(
            onTap: () {
              // context.read<PostCubit>().fetchPosts();
              context.read<PostBloc>().add(FetchPostEvent());
            },
            child: Center(child: Text("CHECK YOUR CODE :/")),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
