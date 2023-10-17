import 'package:coffeelito/bloc/coffee/coffee_event.dart';
import 'package:coffeelito/bloc/coffee/coffee_state.dart';
import 'package:coffeelito/data/firebase_service/coffee_service.dart';
import 'package:coffeelito/data/form_status/form_status.dart';
import 'package:coffeelito/data/models/product/product_model.dart';
import 'package:coffeelito/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc({required this.coffeeService}) : super(const CoffeeState(
          status: FormStatus.pure,
          statusText: "",
          coffeeModel: [],
      )) {
    on<AddCoffee>(_addProduct);
    on<GetCoffee>(_getProduct);
    on<UpdateCoffee>(_updateProduct);
    on<DeleteCoffeeEvent>(_deleteProduct);
  }

  final CoffeeService coffeeService;

  List<CoffeeModel> newCoffee = [];

  _addProduct(AddCoffee event, Emitter<CoffeeState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.addProduct));
    await coffeeService.addProduct(coffeeModel: event.newCoffee);
    emit(
      state.copyWith(
        statusText: StatusTextConstants.addProduct,
        status: FormStatus.success,
        coffeeModel: [...state.coffeeModel, event.newCoffee],
      ),
    );
  }

  _getProduct(GetCoffee event, Emitter<CoffeeState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.getProduct));
    await coffeeService.getAllProducts();
    emit(
      state.copyWith(
        statusText: StatusTextConstants.getProduct,
        status: FormStatus.success,
        coffeeModel: newCoffee,
      ),
    );
  }

  _updateProduct(UpdateCoffee event, Emitter<CoffeeState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.updateProduct));
    await coffeeService.updateProduct(coffeeModel: event.newCoffee);
    emit(
      state.copyWith(
        statusText: StatusTextConstants.updateProduct,
        status: FormStatus.success,
        coffeeModel: [...state.coffeeModel, event.newCoffee],
      ),
    );
  }

  _deleteProduct(DeleteCoffeeEvent event, Emitter<CoffeeState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.deleteProduct));
    await coffeeService.deleteProduct(coffeeId: event.id.toString());
    emit(
      state.copyWith(
        statusText: StatusTextConstants.deleteProduct,
        status: FormStatus.success,
        coffeeModel: [...state.coffeeModel.where((e) => e.coffeeId != event.id)],
      ),
    );
  }
}
