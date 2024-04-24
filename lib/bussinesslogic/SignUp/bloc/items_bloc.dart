import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:testelkony/bussinesslogic/SignUp/bloc/items_event.dart';
import 'package:testelkony/bussinesslogic/SignUp/bloc/items_state.dart';
import 'package:testelkony/repositery/ItemRepositery.dart';





class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;

  ItemBloc(this.repository) : super(ItemInitial()) {
    on<FetchItems>(_onFetchItems);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    try {
      final items = await repository.fetchItems();
      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError('Failed to load items'));
    }
  }
  
}
