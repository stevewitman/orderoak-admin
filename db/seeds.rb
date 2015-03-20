User.delete_all
Store.delete_all
Menuitem.delete_all

testuser = User.create!(
  first_name: 'Test',
  last_name: 'User',
  email: 'test@example.com',
  password: 'test',
  role: 'manager'
)

mike = User.create!(
  first_name: 'Mike',
  last_name: 'Miller',
  email: 'mike@example.com',
  password: 'test',
  role: 'manager'
)

melissa = User.create!(
  first_name: 'Melissa',
  last_name: 'Melborne',
  email: 'melissa@example.com',
  password: 'test',
  role: 'manager'
)

vince =  User.create!(
  first_name: 'Vince',
  last_name: 'Vaughn',
  email: 'vince@example.com',
  password: 'test',
  role: 'visitor'
)

store1 = Store.create!(
  name: 'The Stampede',
  address: '1300 Walnut Street',
  city: 'Boulder',
  state: 'CO',
  zip: '80304',
  phone: '303-333-3333',
  url: 'thestampede.com',
  latitude: 40.014354,
  longitude: -105.278605
)

store2 = Store.create!(
  name: 'The Slope',
  address: '100 Broadway Ave',
  city: 'Boulder',
  state: 'CO',
  zip: '80304',
  phone: '303-123-7654',
  url: 'theslope.com',
  latitude: 40.016458,
  longitude: -105.281320
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "1Appetizers",
  name: "Chips & Salsa",
  description: "",
  price: 395,
  in_stock: true,
  photo: "",
  position: 1
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "1Appetizers",
  name: "Potato Skins",
  description: "",
  price: 495,
  in_stock: true,
  photo: "",
  position: 2
)

Menuitem.create!(
store_id: store2.id,
menugroup: "1Appetizers",
  name: "French Fries",
  description: "",
  price: 495,
  in_stock: true,
  photo: "",
  position: 3
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "2Entrees",
  name: "Hamburger",
  description: "1/4 Pound all beef burger with lettuce, tomato, and pickle.",
  price: 895,
  in_stock: true,
  photo: "restaurant-2.jpg",
  position: 1
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "2Entrees",
  name: "Chicago Dog",
  description: "1/4 Pound all beef burger with onions, tomato, pickle and peppers.",
  price: 795,
  in_stock: true,
  photo: "restaurant-2.jpg",
  position: 2
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "2Entrees",
  name: "Chicken Burrito",
  description: "Chicken, rice, beans, salsa and guacamole wrapped in a flour tortilla.",
  price: 895,
  in_stock: true,
  photo: "restaurant-2.jpg",
  position: 3
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "3Drinks",
  name: "Coke",
  description: "",
  price: 195,
  in_stock: true,
  photo: "",
  position: 1
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "3Drinks",
  name: "Iced Tea",
  description: "",
  price: 195,
  in_stock: true,
  photo: "",
  position: 2
)

Menuitem.create!(
  store_id: store2.id,
  menugroup: "3Drinks",
  name: "Coors Light",
  description: "",
  price: 295,
  in_stock: true,
  photo: "",
  position: 3
)
