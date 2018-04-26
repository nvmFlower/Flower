10.times do |n|
  name = Faker::Name.name
  email = "admin@gmail.com"
  password = "password"
  address = "#{n+1} home"
  phone = "0163489551#{n+1}"
  User.create(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
      address: address,
      phone: phone,
      is_admin: true
    )
end
