# db/seeds.rb

puts "🌱 Seeding Admin..."

Admin.find_or_create_by!(email: "aprovaredacao@gmail.com") do |admin|
  admin.password = "123321"
end

puts "✅ Admin criado com sucesso."
