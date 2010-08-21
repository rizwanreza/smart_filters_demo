200.times do
  AddressBook.create( :name => Faker::Name.name, 
                      :address => "#{Faker::Address.street_address}\n#{Faker::Address.city} #{Faker::Address.us_state} #{Faker::Address.zip_code}\nUSA",
                      :company => Faker::Company.name,
                      :email => Faker::Internet.email,
                      :zipcode => Faker::Address.zip_code,
                      :phone => Faker::PhoneNumber.phone_number,
                      :domain => Faker::Internet.domain_name )
  print '.'
end