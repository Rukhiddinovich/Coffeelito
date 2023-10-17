part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final FormStatus status;
  final List<CategoryModel> categoryModel;
  final String statusText;

  const CategoryState(
      {required this.statusText,
      required this.status,
      required this.categoryModel});

  CategoryState copyWith({
    FormStatus? status,
    List<CategoryModel>? categoryModel,
    String? statusText,
  }) =>
      CategoryState(
          statusText: statusText ?? this.statusText,
          status: status ?? this.status,
          categoryModel: categoryModel ?? this.categoryModel);

  @override
  List<Object?> get props => [status, statusText, categoryModel];
}