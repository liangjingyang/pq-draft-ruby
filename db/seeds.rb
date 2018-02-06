# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_create_by!(
  name: '发言人的草稿箱',
  uid: '053286898350', 
  provider: 'wx',
)
user.update_attribute(:image, 'http://p2qeugd65.bkt.clouddn.com/1/fd5aabf071657314fef8f19ea22f960a.png')
box = user.box
box.update_attribute(:image, "http://p2qeugd65.bkt.clouddn.com/1/7fb12f890f2f4ac0861975a5e48ab115.png")
box.posts.delete_all

# 添加的时候, 按照created_at倒序
box.posts.create!(
  content:
"""给小程序的各个页面增加分享功能
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/4145e075f9f8b596d48aa06769c964b9.png"
  ],
  mini_program: true,
  created_at: "2018-01-19",
)

box.posts.create!(
  content:
"""小程序增加详情页面
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/e8e1074931cfe8d00963ff1ce1851b6a.jpg"
  ],
  mini_program: true,
  created_at: "2018-01-19",
)

box.posts.create!(
  content:
"""服务端给post增加copy接口
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/b220150a36331c61638406bcf3053810.jpg"
  ],
  mini_program: true,
  created_at: "2018-01-19",
)

box.posts.create!(
  content:
"""小程序和服务端联调, 调通各个api接口
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/bc21426085b439f24ba484a56638f6ed.jpg"
  ],
  mini_program: true,
  created_at: "2018-01-18",
)

box.posts.create!(
  content:
"""测试一下emoji...
😬😑😐😶😱😆❤️🚘🚖➢✪☞☛€¥¢®©&⅋🀌🀍🀎‰‱
""",
  images: [
  ],
  mini_program: true,
  created_at: "2018-01-18",
)

box.posts.create!(
  content:
"""小程序的开发完成页面的上拉加载和下拉刷新
服务端丰富seed数据, 并部署到服务器上
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
  ],
  mini_program: true,
  created_at: "2018-01-18"
)

box.posts.create!(
  content:
"""开始小程序的开发, 小程序打算有2个主要页面:
1.草稿箱详情页面, 显示用户的草稿箱里点亮小程序图标的草稿
2.图片详情(也可能不做)
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://p2qeugd65.bkt.clouddn.com/1/52f962bf1fc70cc9ff2e5fcd55ee2bde.jpg"
  ],
  mini_program: true,
  created_at: "2018-01-17"
)

box.posts.create!(
  content:
"""服务端的单元测试和seed data
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/72633aa2fca711f716d9427ed048318a.png"
  ],
  mini_program: true,
  created_at: "2018-01-16"
)

box.posts.create!(
  content: 
"""继续服务端开发:
1.登录登出的controller
2.box和post的controller
2.jbuilder
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://p2qeugd65.bkt.clouddn.com/1/c29230951080cae36929ec6a7343b519.png"
  ],
  mini_program: true,
  created_at: "2018-01-15"
)

box.posts.create!(
  content: 
"""今天开始实现服务端, 采用rails api only, 想用Elixir Phoenix. 但考虑到时间问题, 先用rails, 以后用Phoenix重写.
1.项目搭建
2.数据结构
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://p2qeugd65.bkt.clouddn.com/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://p2qeugd65.bkt.clouddn.com/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://p2qeugd65.bkt.clouddn.com/1/7fb12f890f2f4ac0861975a5e48ab115.png"
  ],
  mini_program: true,
  created_at: "2018-01-14"
)

box.posts.create!(
  content: 
"""今天的完善了原型图的菜单和细节, 主要包括:
1.我的草稿箱二维码
2.我的小程序码
3.扫码添加草稿箱
4.点亮小程序图标
5.复制草稿
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/9ef424cf1b898d11da79aaebcdf994cd.jpg"
  ],
  mini_program: true,
  created_at: "2018-01-13"
)

box.posts.create!(
  content: 
"""今天开始着手原型图设计, 参考`知识星球`和`轻芒阅读`, 核心功能只有5个界面:
1.首页, 列出所有的草稿箱.
2.草稿箱详情页.
3.草稿新建和编辑页面.
4.关注我的
5.二维码和小程序码
""",
  images: [
    "http://p2qeugd65.bkt.clouddn.com/1/46e74d705da89b0b01701b509b19a8f7.png"
  ],
  mini_program: true,
  created_at: "2018-01-12"
)