User.create!([
  {name: "Randy Grullon", email: "drzgamer@gmail.com", password_digest: "$2a$10$cxWqoH2GpSKp5qm9i9BpsOEVw3psJ9ogTUwlxGV7kIzQd9QBLtWdm", remember_digest: nil, isadmin: true},
  {name: "TEst", email: "test@test.com", password_digest: "$2a$10$bjci7w9zcYGbTklV4JZqoOHJYz9YNrr2S.gh591i7/rQraGvwmNa6", remember_digest: nil, isadmin: false},
  {name: "Test", email: "test@email.com", password_digest: "$2a$10$5.i3rq3fCyzlDmzi8RxgvuS2PFKLYag5oQqV0qL5HkstN1vFQOGHG", remember_digest: nil, isadmin: false}
])
Item.create!([
  {name: "Wine", price: "12.99", quantity: 0, image_file_name: "download.jpg", image_content_type: "image/jpeg", image_file_size: 3496, image_updated_at: "2016-05-25 01:09:02"},
  {name: "Beer", price: "2.99", quantity: 4, image_file_name: "2016-05-10.jpg", image_content_type: "image/jpeg", image_file_size: 26362, image_updated_at: "2016-05-25 01:09:03"},
  {name: "Chicken", price: "3.99", quantity: 1, image_file_name: "13230103_463836667146492_2615388126559202653_n.jpg", image_content_type: "image/jpeg", image_file_size: 11698, image_updated_at: "2016-05-25 01:09:03"},
  {name: "Steak", price: "4.99", quantity: 8, image_file_name: "download_(1).jpg", image_content_type: "image/jpeg", image_file_size: 13739, image_updated_at: "2016-05-25 01:09:04"},
  {name: "Bananas", price: "0.29", quantity: 100, image_file_name: "b84b32f1e0817761970fd57ac94b5c44.jpg", image_content_type: "image/jpeg", image_file_size: 29428, image_updated_at: "2016-05-25 03:59:04"},
  {name: "Stuffed Bear", price: "14.99", quantity: 25, image_file_name: "58ba04ee5541432035e377cc77c85409.jpg", image_content_type: "image/jpeg", image_file_size: 68341, image_updated_at: "2016-05-25 04:00:15"},
  {name: "Real Bear", price: "563.0", quantity: 10, image_file_name: "enhanced-30070-1426089023-22.jpg", image_content_type: "image/jpeg", image_file_size: 63024, image_updated_at: "2016-05-25 04:01:48"}
])
