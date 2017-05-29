# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

# product
# Product.create!(title: "吐鲁番玫瑰红葡萄干",
#    description: "粒粒葡萄干专注为你",
#    price: 14.9,
#    quantity: 45,
#    category_id: 2,
#     particulars: "程序员都爱吃的葡萄干。
#     果粒饱满 果肉多而无籽 体态均匀。<br><br>商品介绍<br>
#     image: open("https://img12.360buyimg.com/n1/jfs/t2929/116/316900594/339350/eed74803/5754ed01N2878a924.jpg")",
#    )


Product.create!(title: "吐鲁番玫瑰红葡萄干",
   description: "粒粒葡萄干专注为你",
   price: 248,
   quantity: 30,
   category_id: 2,

   particulars: "程序员都爱吃的葡萄干。
       果粒饱满 果肉多而无籽 体态均匀。<br><br>商品介绍< img alt=\"\" src=\"https://img12.360buyimg.com/n1/jfs/t2929/116/316900594/339350/eed74803/5754ed01N2878a924.jpg\">",
      image: open("https://img12.360buyimg.com/n1/jfs/t2929/116/316900594/339350/eed74803/5754ed01N2878a924.jpg")
   )

Product.create!(
       title: "黄桃罐头",
       description: "良品铺子 黄桃果捞罐头300g*2 水果果捞新鲜糖水休闲零食小吃 黄桃果捞 300g*2",
       price: 14.99,
       quantity: 50,
       category_id: 1,
       particulars: "自然原果，新鲜晾晒。我们一只坚持给家人吃的，才卖给我们可爱的程序元吃",
       image: open("https://img11.360buyimg.com/n1/jfs/t3118/283/7649380604/237029/4cb8d826/58b8e8d9N10bf9543.jpg")

)

Product.create!(
       title: "冻干榴莲干",
       description: "百草味 零食特产水果干 金枕头榴莲干 口袋鲜果 冻干榴莲干30g/袋",
       price: 14.99,
       quantity: 50,
       category_id: 1,
       particulars: "自然原果，新鲜晾晒。我们一只坚持给家人吃的，才卖给我们可爱的程序元吃",
       image: open("https://ww2.sinaimg.cn/large/006tNbRwly1fg26bd9mybj309q09qjss.jpg")

)
