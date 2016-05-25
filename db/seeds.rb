User.create!([
  {name: "Randy Grullon", email: "drzgamer@gmail.com", password: "adminpassword", password_confirmation: "adminpassword", isadmin: true},
  {name: "Bob John", email: "bobjohn@coolbeans.com", password: "coolpassword", password_confirmation: "coolpassword", remember_digest: nil, isadmin: false}
])