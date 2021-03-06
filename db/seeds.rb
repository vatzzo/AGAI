users = [
  {
    email: 'tomasz@example.com',
    password: 'admin123',
    is_admin: false
  },
  {
    email: 'kamil@example.com',
    password: 'admin123',
    is_admin: false
  },
  {
    email: 'kuba@example.com',
    password: 'admin123',
    is_admin: false
  },
  {
    email: 'admin@example.com',
    password: 'admin123',
    is_admin: true
  }
]

images = [
  {
    src: Rails.root.join('app', 'assets', 'images', 'ACTIVITIES','cooking-min.jpg'),
    file_name: 'cooking-min.jpg'
  },
  {
    src: Rails.root.join('app', 'assets', 'images', 'ACTIVITIES','guitar-min.jpg'),
    file_name: 'guitar-min.jpg'
  },
  {
    src: Rails.root.join('app', 'assets', 'images', 'ACTIVITIES','skating-min.jpg'),
    file_name: 'skating-min.jpg'
  }
]

avatars = [
  {
    src: Rails.root.join('app', 'assets', 'images', 'USERS', 'user_1-min.jpg'),
    file_name: 'user_1-min.jpg'
  },
  {
    src: Rails.root.join('app', 'assets', 'images', 'USERS', 'user_2-min.jpg'),
    file_name: 'user_2-min.jpg'
  }
]

users.each do |user|
  user = User.create_with(password: user[:password]).find_or_create_by(email: user[:email], is_admin: user[:is_admin])

  avatar = avatars[rand(0..avatars.length-1)]

  user.avatar.attach(io: File.open(avatar[:src]), filename: avatar[:file_name])
end

while Activity.count <= 20
    email= users[rand(0..users.length-1)][:email]

    activity = Activity.new(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(sentence_count: 6),
      is_public: true,
      user: User.find_by(email: email),
      deadline: Time.now
    )

    image = images[rand(0..images.length-1)]

    activity.image.attach(io: File.open(image[:src]), filename: image[:file_name])

    activity.save

    activity.steps.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph(sentence_count: 3),
      is_done: rand(0...1) == 1
    )
end
