class ItemMufrodat {
  final String indonesian;
  final String arabic;

  const ItemMufrodat(this.indonesian, this.arabic);
}

class CategoryMufrodat {
  final String title;
  final List<ItemMufrodat> items;

  const CategoryMufrodat({required this.title, required this.items});
}
