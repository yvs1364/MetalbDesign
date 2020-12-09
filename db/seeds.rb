require "open-uri"

Item.destroy_all
User.destroy_all

yvan = User.create!(name: 'Yvan', email: 'yvan@mail.fr', password: 'Foresturea1337')
bastien = User.create!(name: 'Bastien', email: 'bastien@mail.fr', password: 'Foresturea1337')
puts "#{yvan.name} and #{bastien.name} are created"

4.times do
  item = Item.create!(
    user: yvan,
    name: ["name1", "name2", "name3"].sample,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Maecenas tempus risus nec ultricies condimentum."
    )
    file = URI.open("https://res.cloudinary.com/dgz9pmu6z/image/upload/v1600443657/119722099_269361067391200_3184124215757409559_n_dnkh4b.jpg")
  item.photos.attach(io: file, filename: 'table.png')
  end
puts "#{Item.count} item are created"

