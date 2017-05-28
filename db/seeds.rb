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
# Product.create!(title: "Cherry Keyboard",
#    description: "G80-3000键盘",
#    price: 2800,
#    quantity: 5,
#    image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
#    )

  #  Product.create!(title: "WIT智能读屏台灯",
  #     description: "明基WiT智能读屏台灯，专为阅读屏幕而生，妈妈再也不用担心我熬夜伤眼睛了",
  #     price: 1899,
  #     quantity: 5,
  #     image: open("http://img.benq.cn/20161021/48823/20161021_48823_430_283.jpg")
  #     )

      Product.create!(title: "智能读屏台灯",
         description: "明基WiT智能读屏台灯，专为阅读屏幕而生，妈妈再也不用担心我熬夜伤眼睛了",
         price: 1899,
         quantity: 5,
         category_id: 2,
         image: open("http://img.benq.cn/20161021/48823/20161021_48823_430_283.jpg")
         )

       Product.create!(title: "WIT智能读屏台灯",
          description: "明基WiT智能读屏台灯，专为阅读屏幕而生，妈妈再也不用担心我熬夜伤眼睛了",
          price: 1899,
          quantity: 5,
          category_id: 2,
          # particulars: "数位生活 需要一盏符合现代阅读习惯的灯<br><br>细节介绍<br>
          # <img alt=\"\" src=\"http://ww3.sinaimg.cn/large/006tKfTcgy1ffr52b0kiej30ue0mimz4.jpg\">",
          image: open("https://1.bp.blogspot.com/-Q9FU-Y0gLng/V6fkGRxSu9I/AAAAAAAAgdk/qADVMmPEVd0PLAn_7Nqv9fqornhfMLH7wCEw/s1600/71l-m7J%252BDyL._SL1500_.jpg")
          )

      Product.create!(title: "WiT-Floor时尚阅读落地灯",
         description: "满足多种照明情境，品味质感生活",
         price: 2899,
         quantity: 45,
         category_id: 2,
        #  particulars: "主打120公分宽广均匀照明，低调媲美奢华顶灯，却做到18w功率的节能设计。
        #  WiT Floor拥有13段色温*13段亮度选择，塑造完美169种灯光梯度，黄白光随性搭配、个性定制。从此每个人都是光氛师，想要昏黄暧昧还是明亮冷静，专注亦或放松，都由你来主宰。<br><br>细节介绍<br>
        #  <img alt=\"\" src=\"http://img.benq.cn/20160707/45581/20160707_45581_430_283.jpg">",
         image: open("http://img.benq.cn/20160707/45578/20160707_45578_430_283.jpg")
         )

         Product.create!(title: "Cherry G80-3000机械键盘",
            description: "Cherry的秋天！敲击中体味秋高气爽，嗯，韵爸同款,同韵爸一样",
            price: 709,
            quantity: 5,
            category_id: 2,
            image: open("https://img11.360buyimg.com/n1/s450x450_jfs/t1846/259/2740984977/179352/c1fcea57/56f3984bNcde7899f.jpg")
            )
