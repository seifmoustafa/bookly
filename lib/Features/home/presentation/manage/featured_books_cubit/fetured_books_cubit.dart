import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetured_books_state.dart';

class FeturedBooksCubit extends Cubit<FeturedBooksState> {
  FeturedBooksCubit() : super(FeturedBooksInitial());
}
