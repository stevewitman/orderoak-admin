module ObjectCreationMethods
  def create_item(overrides = {})
    defaults = {
      title: "Chicken Burrito",
      description: "Chicken, rice, and beans, smothered in our famous ...",
      price: "695",
      item_on_menu: true,
      item_in_stock: true,
    }
    Item.create(defaults.merge(overrides))
  end
end
