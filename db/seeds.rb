# db/seeds.rb

puts "🌱 Seeding Admin..."

Admin.find_or_create_by!(email: "aprovaredacao@gmail.com") do |admin|
  admin.password = "123321"
end

ActiveStorage::Blob.where(service_name: 'local').each do |blob|
  blob.attachments.each(&:purge)
  blob.purge
end

puts "✅ Admin criado com sucesso."
