# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ category: 'Star Wars' }, { category: 'Lord of the Rings' }])
#   Character.create(category: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

 # product

Product.create!(
       title: "冻干草莓",
       description: "温馨提示1、本品除明确质量问题外不支持30天无忧退货
                      <br>2.冻干草莓为整颗草莓，老人小孩请在成人照顾下食用",
        price: 16,
        quantity: 45,
        category_id: 2,
        image: open("#{Rails.root}/app/assets/images/01.png")
)

# Product.create!(
#       title: "冻干菠萝蜜",
#      description: "热带果园，纯正果品",
#       price: 39,
#       quantity: 10,
#       category_id: 2,
#       image: open("#{Rails.root}/app/assets/images/02.png")
#
# )
#
# Product.create!(
#      title: "胎菊",
#      description: "桐乡胎菊，上品花茶，50克装",
#       price: 26.9,
#       quantity: 20,
#       category_id: 3,
#       image: open("#{Rails.root}/app/assets/images/03.png")
#
# )
#  Product.create!(
#     title: "大麦茶",
#      description: "酷暑标配，去油良品, 220g",
#     price: 39,
#     quantity: 9,
#     category_id: 3,
#     image: open("#{Rails.root}/app/assets/images/04.png")
# )
#
# Product.create!(
#     title: "芒果味棉花糖麻薯",
#     description: "俘获芳心只用三层夹心",
#     price: 18,
#     quantity: 2,
#     category_id: 1,
#     image: open("#{Rails.root}/app/assets/images/05.png")
#     )
    #  description: "俘获芳心只用三层夹心",
    # price: 18,
    # quantity: 2,
    # category_id: 1,
    # image: open("https://ww4.sinaimg.cn/large/006tNbRwgy1fg2kuv4fb7j306t06taan.jpg")

#
# Product.create!(
#      title: "元气生活",
#     description: "元气生活，美丽动仁",
#      price: 118,
#      quantity: 7,
#      image: open("https://ww2.sinaimg.cn/large/006tNbRwgy1fg2kyf9gdbj306t06tjsd.jpg")
# )
