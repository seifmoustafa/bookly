part of 'fetured_books_cubit.dart';

abstract class FeturedBooksState extends Equatable {
  const FeturedBooksState();

  @override
  List<Object> get props => [];
}

class FeturedBooksInitial extends FeturedBooksState {}

class FeturedBooksLoading extends FeturedBooksState {}

class FeturedBooksFailure extends FeturedBooksState {
  final String errMessage;

  const FeturedBooksFailure(this.errMessage);
}

class FeturedBooksSuccess extends FeturedBooksState {
  final List<BookModel> books;

  const FeturedBooksSuccess(this.books);
}
