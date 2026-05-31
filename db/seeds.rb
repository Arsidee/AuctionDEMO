AdminUser.find_or_create_by!(email: "admin@example.com") do |a|
  a.password = "password123"
  a.password_confirmation = "password123"
end

puts "AdminUser created: admin@example.com / password123"

User.find_or_create_by!(email: "user@example.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end

puts "User created: user@example.com / password123"

auction = Auction.find_or_create_by!(name: "Spring Demo Auction") do |a|
  a.description = "A sample auction to demonstrate the app."
  a.start_time = Time.current - 1.hour
  a.end_time = Time.current + 3.minutes
end

lot1 = auction.lots.find_or_create_by!(name: "Vintage Watch") do |l|
  l.description = "A classic timepiece in excellent condition."
  l.starting_price = 50.00
end

lot2 = auction.lots.find_or_create_by!(name: "Oil Painting") do |l|
  l.description = "Original oil on canvas, 24x36 inches."
  l.starting_price = 200.00
end

puts "Sample auction and lots created."
