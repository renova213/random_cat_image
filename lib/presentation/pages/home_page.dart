import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/presentation/bloc/cat_bloc.dart';
import 'package:random_cat/presentation/pages/widgets/cat_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Cat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is Empty) {
              return Center(
                child: Image.asset('assets/image.jpg'),
              );
            } else if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              return CatDisplay(cat: state.cat!);
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          return FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<CatBloc>(context).add(GetCatFromRandomImage());
            },
          );
        },
      ),
    );
  }
}
