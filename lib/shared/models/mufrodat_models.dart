class ItemMufrodat {
  final String indonesian;
  final String arabic;
  final String? note;

  const ItemMufrodat({
    required this.indonesian,
    required this.arabic,
    this.note,
  });
}

class CategoryMufrodat {
  final String title;
  final List<ItemMufrodat> items;

  const CategoryMufrodat(this.title, this.items);
}
