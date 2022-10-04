import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat/core/error/failure.dart';
import 'package:random_cat/domain/entities/cat.dart';
import 'package:random_cat/domain/usecases/get_random_cat_image.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final GetRandomCatImage getRandomCatImage;
  CatBloc({required this.getRandomCatImage}) : super(Empty()) {
    on<GetCatFromRandomImage>((event, emit) async {
      emit(
        Loading(),
      );
      final failureOrCat = await getRandomCatImage.call();

      failureOrCat.fold(
        (failure) => emit(
          Error(
            errorMessage: _mapFailureOrMessage(failure),
          ),
        ),
        (cat) => emit(
          Loaded(cat: cat),
        ),
      );
    });
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}
