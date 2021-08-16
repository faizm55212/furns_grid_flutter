class Product {
  final int? no;
  final String? name;
  final String? desc;
  final int? price;
  final bool? isFavorite;
  final List? imgUrl;
  List? colors = [];
  Product(
      {this.no,
      this.name,
      this.desc,
      this.price,
      this.isFavorite,
      this.colors,
      this.imgUrl});
}
