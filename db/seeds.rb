10.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "password"
  address = "#{n+1} home"
  phone = "0163489551#{n+1}"
  User.create(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      address: address,
      phone: phone
    )
end

3.times do |n|
  Design.create(name: Faker::Types.string
    )
end

Product.create!(
    name: Faker::Name.name,
    price: Faker::Number.between(200, 300),
    img: "l1.jpg",
    many_or_not: Faker::Boolean.boolean,
    sale: Faker::Number.between(200, 300),
    details: Faker::Lorem.sentences,
    view: 5,
    rating: Faker::Number.between(1, 3),
    design_id: Faker::Number.between(1, 3) )

10.times do |n|
  Product.create(
    name: Faker::Name.name,
    price: Faker::Number.between(200, 300),
    img: "l1.jpg",
    many_or_not: Faker::Boolean.boolean,
    details: Faker::Lorem.sentences,
    view: Faker::Number.between(1, 5),
    rating: Faker::Number.between(1, 3),
    design_id: Faker::Number.between(1, 3))

  Comment.create(
    content: Faker::Lorem.sentences,
    status: false,
    product_id: Faker::Number.between(1, 10),
    user_id: Faker::Number.between(1 , 10),
    )
end

3.times do |n|
  Occasion.create(
    name: Faker::Name.name
    )
  Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.sentences,
    img: "l1.jpg",
    user_id: Faker::Number.between(1, 10)
    )
  Rating.create(
    star_number: Faker::Number.between(1, 5),
    user_id: Faker::Number.between(1, 10),
    product_id: Faker::Number.between(1, 10),
    )
  Sale.create(
    date_start: Faker::Date.between(30.days.ago, 2.days.ago),
    date_end: "Wed, 24 Sep 2018",
    occasion_id: Faker::Number.between(1, 3),
    )
  Color.create(
    name: Faker::Color.color_name
    )
  TypeFlower.create(
      name: Faker::Name.name
    )
  ProductColor.create(
    product_id: Faker::Number.between(1, 10),
    color_id: Faker::Number.between(1, 3),
    )
  ProductOccasion.create(
    product_id: Faker::Number.between(1, 10),
    occasion_id: Faker::Number.between(1, 3),
    )
  ProductType.create(
    product_id: Faker::Number.between(1, 10),
    type_flower_id: Faker::Number.between(1, 3),
    )
end

