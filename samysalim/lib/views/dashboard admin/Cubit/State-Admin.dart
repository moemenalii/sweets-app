abstract class adminState {}

class InitialState extends adminState{}

class pickedProductImageSuccess extends adminState{}

class pickedProductImageError extends adminState{}

class UploadProductImageLoading extends adminState{}

class UploadProductImageSuccess extends adminState{}

class UploadProductImageError extends adminState{}

class pickedCategoryImageSuccess extends adminState{}

class pickedCategoryImageError extends adminState{}

class UploadCategoryImageLoading extends adminState{}

class UploadCategoryImageSuccess extends adminState{}

class UploadCategoryImageError extends adminState{}

class UploadProductLoading extends adminState{}

class UploadProductSuccess extends adminState{}

class UploadProductError extends adminState{}

class changeCategoryValue extends adminState{
  String ? value;
}
//get product

class GetProductsLoading extends adminState{}

class GetProductsSuccess extends adminState{}

class GetProductsError extends adminState{}

//delet product

class DeleteProductLoading extends adminState{}

class DeleteProductSuccess extends adminState{}

class DeleteProductError extends adminState{}





