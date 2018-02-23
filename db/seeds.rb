# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

random = Random.new(1)
now = Time.now

box_image_list = [
  "FhTGbaiYXMT7Of_n0uj22_sdUeaH.jpg",
  "1/7fb12f890f2f4ac0861975a5e48ab115.png",
  "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
  "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
  "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
  "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
  "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
  "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
  "1/31bbc1290303b666351aa1272d440cdc.png",
  "1/1896d7ec64ee7dbdd108da24d1223d8e.png"
]

user_name_list = ['首席技术官', '首席运管官', '首席信息官', '首席执政官', '首席执行官', 
  '首席zz官', '首席yy官', '首席xx官', '首席外交官', '首席财政官',
  '李文彬', '潘增生', '徐振帅', '吴英道', '郭福兴', '江熠芳', '沈鸿妍', '芦炎琳', '郭景红', '李世元', 
  '彭浩云', '苏松陆', '温妙娜', '赵新威', '陈运光', '张芹坤', '陈幸刚', '陈军乐', '夏钿英', '朱彬洪', 
  '韩裕祥', '孙富然', '杨兴东', '高秋英', '董瑞坤', '吴秀敏', '于少葵', '杨克锴', '殷广霞', '樊东公', 
  '刘芳珊', '陈文玲', '张雪文', '任晓诗', '王迪洋', '张川燕', '龙熙年', '吕青全', '胡仙芝', '吴震知', 
  '陈红忠', '张有兰', '刘幼陵', '鲁春封', '陈尧宪', '王婉薇', '刘颢涵', '王雨臣', '陆玮可', '蔡寻家', 
  '宋顶科', '张志华', '刘文祥', '周贻伟', '尤艳睿', '王寿韬', '周汉琛', '萧志若', '袁海帅', '赵昀郁', 
  '王玫龙', '陈春石', '杜思圻', '杨俊西', '陈彦平', '王鹏东', '张艺东', '齐彦娅', '陈延平', '杨明杰', 
  '杨音阳', '陈建帆', '吴怡强', '郑婉世', '邓春国', '罗信宾', '孙耀飞', '林奉弟', '李鸥祺', '任倩飞', 
  '卢学辉', '吕实金', '李凡锋', '彭灼礼', '胡葆娟', '薛城景', '沈国菊', '王泓宜', '王江青', '王伟祥', 
  '胡莉帝']
uid = 1

user_name_list.each do |user_name|
  uid = uid + 1
  days = random.rand(user_name_list.size) * (-10) - 30
  user = User.find_or_create_by!(
    name: user_name,
    uid: uid,
    provider: 'wx',
  )
  image_index = random.rand(box_image_list.size)
  user.update_column(:image, box_image_list[image_index])
  box = user.box
  box.update_column(:image, box_image_list[image_index])
  box.posts.delete_all

  content = <<-EOF
2018-02-22 开发日志:
优化服务端sql, 完成关于我们页面, 申请微信支付, 小程序提交新版本统一域名, 以及各种细节优化
EOF
    box.create_post!(
      content: content,
      images: [
        "1/b6db8ee93b885d21b94b827adf68c367.jpeg"
      ],
      mini_program: true,
      created_at: now + 1.day * (days + 29)
    )
  content = <<-EOF
2018-02-21 开发日志:
前端增加搜索全部的界面, 调通searchAll接口, 高亮搜索关键词
EOF
  box.create_post!(
    content: content,
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 29)
  )

  content = <<~EOF
2018-02-20 开发日志:
接入elasticsearch, 但暂时没有用到, 实现服务端4个搜索接口
EOF
  box.create_post!(
    content: content,
    images: [
      "http://cdn.draftbox.cn/1/1896d7ec64ee7dbdd108da24d1223d8e.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 28)
  )

  content = <<~EOF
2018-02-19 开发日志:
梳理服务端controller的rspec, 在post里增加box和user的冗余关系;
实现最新动态接口和界面
EOF
  box.create_post!(
    content: content,
    images: [
      "http://cdn.draftbox.cn/1/31bbc1290303b666351aa1272d440cdc.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 27)
  )

  content = <<~EOF
2018-02-14 开发日志:
1. 引入popup第三方库 
2. 实现广告展现策略
EOF
  box.create_post!(
    content: content,
    images: [
      "http://cdn.draftbox.cn/1/94ac2ea174c428b13351257b3643ef32.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 26)
  )

  content = <<~EOF
2018-02-13 开发日志:
1. 前后端添加了"关注我的"功能 
2. 接入Firebase
EOF
  box.create_post!(
    content: content,  
    images: [
      "1/3ddaf1ac583d2a9439efd862536914e4.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 25)
  )

  content = <<~EOF
2018-02-12 开发日志:
1. 实现了产品册封面图片的编辑功能; 
2. 丰富服务端Seed数据, 在Development环境下, 新建用户自动创建多个关注和被关注
EOF
  box.create_post!(
    content: content,  
    images: [
      "1/89cdbbb43b89d4987f5ef8f5a7a1618e.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 24)
  )

  content = <<~EOF
2018-02-11 开发日志:
1 .实现post拷贝功能, 并且在复制的post上显示来源产品册的名字; 
2. 图片选择库切换为FishBun
3. 调整产品册目录页面和接口, 把自己的产品册放在第一个
EOF
  box.create_post!(
    content: content,  
    images: [
      "1/7ee69bf3ff82b70eec6439f82346d02c.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 23)
  )

  content = <<~EOF
2018-02-10 开发日志:
这两天实现了:
1. 二维码生成和分享功能, 用户可以扫码关注册子.
2. #关注我的#功能, 册主可以编辑关注者的访问权限
EOF
  box.create_post!(
    content: content,  
    images: [
      "1/1274879f92fdbdad00bc120988d5e9fc.png",
      "1/db4fe915bab3ab7abc6d7128b564a522.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 22)
  )

  content = <<~EOF
2018-02-08 开发日志:
1. 梳理分享, 拷贝, 小程序图标, 暂时去掉编辑功能
2. 梳理各个页面的menu
EOF
  box.create_post!(
    content: content,
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 21)
  )

  content = <<~EOF
2018-02-07 开发日志:
这两天实现产品发布功能, 以及一键转发朋友圈的功能
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 20)
  )

  content = <<~EOF
2018-02-05 开发日志:
美化界面
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 19)
  )

  content = <<~EOF
2018-02-04 开发日志:
产品详情页面
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 18)
  )

  content = <<~EOF
2018-01-31 开发日志:
截止今天, BoxesActivity和BoxActivity基本完成, 通过这两个activity搭建好了底层: 网络层, Event, 图片加载, Activity基类等
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 17)
  )

  content = <<~EOF
2018-01-26 开发日志:
这两天一直在调研github上的朋友圈项目, 以及一些可能用到的库
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 16)
  )

  content = <<~EOF
2018-01-24 开发日志:
继续udacity的 #Android 应用开发 Android 基础知识# 课程, 最后一节, 十二节
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 15)
  )

  content = <<~EOF
2018-01-23 开发日志:
继续udacity的 #Android 应用开发 Android 基础知识# 课程, 跳过第七八九节, 直接看第十, 十一节
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 14)
  )

  content = <<~EOF
2018-01-22 开发日志:
继续udacity的 #Android 应用开发 Android 基础知识# 课程, 第五, 六节
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 14)
  )

  content = <<~EOF
2018-01-21 开发日志:
继续udacity的 #Android 应用开发 Android 基础知识# 课程, 第三, 四节
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 13)
  )

  content = <<~EOF
2018-01-20 开发日志:
开始开发android, 在udacity上找到 #Android 应用开发 Android 基础知识# 课程, 从头看一遍. 
课程共12节, 今天看前两节
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 12)
  )

  content = <<~EOF
2018-01-19 开发日志3:
给小程序的各个页面增加分享功能
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/4145e075f9f8b596d48aa06769c964b9.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 11)
  )

  content = <<~EOF
2018-01-19 开发日志2:
小程序增加详情页面
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/e8e1074931cfe8d00963ff1ce1851b6a.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 10)
  )

  content = <<~EOF
2018-01-19 开发日志1:
服务端给post增加copy接口
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/b220150a36331c61638406bcf3053810.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 9)
  )

  content = <<~EOF
小程序和服务端联调, 调通各个api接口
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/bc21426085b439f24ba484a56638f6ed.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 8)
  )

  content = <<~EOF
2018-01-18 开发日志:
测试一下emoji...
😬😑😐😶😱😆❤️🚘🚖➢✪☞☛€¥¢®©&⅋🀌🀍🀎‰‱
EOF
  box.create_post!(
    content: content,  
    images: [
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 7)
  )

  content = <<~EOF
小程序的开发完成页面的上拉加载和下拉刷新
服务端丰富seed数据, 并部署到服务器上
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 6)
  )

  content = <<~EOF
2018-01-17 开发日志:
开始小程序的开发, 小程序打算有2个主要页面:
1.草稿箱详情页面, 显示用户的草稿箱里点亮小程序图标的草稿
2.图片详情(也可能不做)
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
      "http://cdn.draftbox.cn/1/52f962bf1fc70cc9ff2e5fcd55ee2bde.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 5)
  )

  content = <<~EOF
2018-01-16 开发日志:
服务端的单元测试和seed data
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/72633aa2fca711f716d9427ed048318a.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 4)
  )

  content = <<~EOF
2018-01-15 开发日志:
继续服务端开发:
1.登录登出的controller
2.box和post的controller
2.jbuilder
EOF
  box.create_post!(
    content: content,  
  images: [
    "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
    "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
    "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
    "http://cdn.draftbox.cn/1/c29230951080cae36929ec6a7343b519.png"
  ],
  mini_program: true,
  created_at: now + 1.day * (days + 3)
  )

  content = <<~EOF
2018-01-14 开发日志:
今天开始实现服务端, 采用rails api only, 想用Elixir Phoenix. 但考虑到时间问题, 先用rails, 以后用Phoenix重写.
1.项目搭建
2.数据结构
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/f3d8a3ba93c031fa6f97d213e6955ce7.png",
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/7fb12f890f2f4ac0861975a5e48ab115.png"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 2)
  )

  content = <<~EOF
2018-01-13 开发日志:
今天的完善了原型图的菜单和细节, 主要包括:
1.我的草稿箱二维码
2.我的小程序码
3.扫码添加草稿箱
4.点亮小程序图标
5.复制草稿
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/9ef424cf1b898d11da79aaebcdf994cd.jpg"
    ],
    mini_program: true,
    created_at: now + 1.day * (days + 1)
  )

  content = <<~EOF
2018-01-12 开发日志:
今天开始着手原型图设计, 参考`知识星球`和`轻芒阅读`, 核心功能只有5个界面:
1.首页, 列出所有的草稿箱.
2.草稿箱详情页.
3.草稿新建和编辑页面.
4.关注我的
5.二维码和小程序码
EOF
  box.create_post!(
    content: content,  
    images: [
      "http://cdn.draftbox.cn/1/46e74d705da89b0b01701b509b19a8f7.png"
    ],
    mini_program: true,
    created_at: now + 1.day * days
  )
end