delivery = Delivery.new(
  pickup_address: "Port Saidweg 45, Purmerend, North Holland, 1448 MS",
  delivery_address: "Luienhoeksestraat 78, Sprundel, North Brabant, 4714 TE",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 1 created"

delivery = Delivery.new(
  pickup_address: "Posthoornstraat 48, Oostzaan, North Holland, 1511 CE",
  delivery_address: "Liuwedaem 48, Gaastmeer, Friesland, 8611 JJ",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
  driver_name: "Sophie de Vries"
)
delivery.save!
puts "delivery 2 created"

delivery = Delivery.new(
  pickup_address: "Smidweg 58, Etten-Leur, North Brabant, 4871 MB",
  delivery_address: "Werktuigstraat 45, Amsterdam, North Holland, 1033 NT",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 3 created"

delivery = Delivery.new(
  pickup_address: "Kerkstraat 20, Amsterdam, North Holland, 1017 GG",
  delivery_address: "Nieuwezijds Voorburgwal 112, Amsterdam, North Holland, 1012 SH",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 4 created"

delivery = Delivery.new(
  pickup_address: "Vijzelstraat 30, Amsterdam, North Holland, 1017 HL",
  delivery_address: "Damstraat 18, Haarlem, North Holland, 2011 CA",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 5 created"

delivery = Delivery.new(
  pickup_address: "Pieter de Hoochstraat 56, Rotterdam, South Holland, 3036 XA",
  delivery_address: "Coolsingel 65, Rotterdam, South Holland, 3012 AG",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
  driver_name: "Liam Jansen"
)
delivery.save!
puts "delivery 6 created"

delivery = Delivery.new(
  pickup_address: "Leidseplein 1, Amsterdam, North Holland, 1017 PT",
  delivery_address: "Herengracht 283, Amsterdam, North Holland, 1016 EB",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 7 created"

delivery = Delivery.new(
  pickup_address: "Zuidplein 77, Rotterdam, South Holland, 3083 WB",
  delivery_address: "Noordmolenstraat 42, Rotterdam, South Holland, 3083 WE",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 8 created"

delivery = Delivery.new(
  pickup_address: "Vondelstraat 92, Rotterdam, South Holland, 3011 KZ",
  delivery_address: "Keizersgracht 585, Amsterdam, North Holland, 1017 DR",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
  driver_name: "Eva van den Berg"
)
delivery.save!
puts "delivery 9 created"

delivery = Delivery.new(
  pickup_address: "De Boelelaan 8, Amsterdam, North Holland, 1081 HV",
  delivery_address: "Heerengracht 48, Amsterdam, North Holland, 1016 EJ",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 10 created"

delivery = Delivery.new(
  pickup_address: "Haarlemmerdijk 16, Amsterdam, North Holland, 1013 JD",
  delivery_address: "Prins Hendrikkade 25, Amsterdam, North Holland, 1012 TM",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
  driver_name: "Eva van den Berg"
)
delivery.save!
puts "delivery 11 created"

delivery = Delivery.new(
  pickup_address: "Westerstraat 56, Amsterdam, North Holland, 1015 MA",
  delivery_address: "Albert Cuypstraat 44, Amsterdam, North Holland, 1072 CT",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 12 created"

delivery = Delivery.new(
  pickup_address: "Lange Nieuwstraat 23, Amsterdam, North Holland, 1013 PE",
  delivery_address: "Geldersekade 7, Amsterdam, North Holland, 1011 EG",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 13 created"

delivery = Delivery.new(
  pickup_address: "Korte Prinsengracht 15, Amsterdam, North Holland, 1015 DS",
  delivery_address: "Pakhuisweg 1, Rotterdam, South Holland, 3011 DW",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
)
delivery.save!
puts "delivery 14 created"

delivery = Delivery.new(
  pickup_address: "Bloemgracht 68, Amsterdam, North Holland, 1016 LP",
  delivery_address: "Damstraat 14, Haarlem, North Holland, 2011 DA",
  weight: rand(1..100),
  scheduled_time: Time.now + rand(1..30).days,
  driver_name: "Liam Jansen"
)
delivery.save!
puts "delivery 15 created"


puts "All deliveries created!"
