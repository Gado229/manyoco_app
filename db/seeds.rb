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
