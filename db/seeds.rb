#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:"Admin",
           email:'monadministrateur@gmail.com',
        password:'madmin1',
           admin:true)
  @tasks=Task.where(user_id:nil)
  @tasks.each do |e|
  e.update(user_id:1)
end

status = ['started', 'pending', 'completed']
priority = ['low', 'medium', 'high']

100.times do |i|
    Task.create(
        title: "task#{i + 1}",
      content: "task detail#{i + 1}",
     deadline: DateTime.now + 10,
       status: status[rand(3)],
     priority: priority[rand(3)],
      user_id: rand(2..22)
    )
end

20.times do |i|
    User.create(
          name: "fake#{i}name",
         email: "fakeemail#{i}@gmail.com",
      password: "password"
      )
end

21.times do |n|
    Label.create(name: "tag_#{n}_#{n+12}")
    
end
