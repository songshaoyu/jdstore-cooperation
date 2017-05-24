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
Product.create!(title: "Cherry Keyboard",
   description: "G80-3000键盘",
   price: 2800,
   quantity: 5,
   particulars: "数位生活 需要一盏符合现代阅读习惯的灯<br><br>细节介绍<br><img alt=\"\" src=\"http://ww3.sinaimg.cn/large/006tKfTcgy1ffr52b0kiej30ue0mimz4.jpg\">",
   image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
   )

Product.create!(title: "WIT智能读屏台灯",
      description: "明基WiT智能读屏台灯，专为阅读屏幕而生，妈妈再也不用担心我熬夜伤眼睛了",
      price: 1899,
      quantity: 5,

      particulars: "数位生活 需要一盏符合现代阅读习惯的灯<br><br>细节介绍<br><img alt=\"\" src=\"http://ww3.sinaimg.cn/large/006tKfTcgy1ffr52b0kiej30ue0mimz4.jpg\">",
      image: open("http://read.html5.qq.com/image?src=forum&q=5&r=0&imgflag=7&imageUrl=http://mmbiz.qpic.cn/mmbiz_jpg/rvaGsRYwibgKe2dWN8MB0TGibia38VOJFoXtSTjZQ5uqIv1cNia01LAr0XicVaSN5G0W43InK3JE4gHQQ3lIyk8ooaA/0?wx_fmt=jpeg")

      image: open("http://img.benq.cn/20161021/48823/20161021_48823_430_283.jpg")

      )

      Product.create!(title: "智能读屏台灯",
         description: "明基WiT智能读屏台灯，专为阅读屏幕而生，妈妈再也不用担心我熬夜伤眼睛了",
         price: 1899,
         quantity: 5,
         category_id: 1,
         image: open("http://img.benq.cn/20161021/48823/20161021_48823_430_283.jpg")
         )
