# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
  user = User.find_or_create_by!(
    name: user_name,
    uid: uid, 
    provider: 'wx',
  )
  user.update_attribute(:image, 'http://cdn.draftbox.cn/1/4145e075f9f8b596d48aa06769c964b9.png')
  box = user.box
  box.update_attribute(:image, "http://cdn.draftbox.cn/FhTGbaiYXMT7Of_n0uj22_sdUeaH.jpg")
  box.posts.delete_all

  box.create_post!(
    content:
  """1. 实现了产品册封面图片的编辑功能; 
  2. 丰富服务端Seed数据, 在Development环境下, 新建用户自动创建多个关注和被关注
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-12",
  )

  box.create_post!(
    content:
  """1 .实现post拷贝功能, 并且在复制的post上显示来源产品册的名字; 
  2. 图片选择库切换为FishBun
  3. 调整产品册目录页面和接口, 把自己的产品册放在第一个
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-11",
  )

  box.create_post!(
    content:
  """这两天实现了:
  1. 二维码生成和分享功能, 用户可以扫码关注册子.
  2. #关注我的#功能, 册主可以编辑关注者的访问权限
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-10",
  )

  box.create_post!(
    content:
  """1. 梳理分享, 拷贝, 小程序图标, 暂时去掉编辑功能
  2. 梳理各个页面的menu
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-8",
  )

  box.create_post!(
    content:
  """这两天实现产品发布功能, 以及一键转发朋友圈的功能
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-7",
  )

  box.create_post!(
    content:
  """美化界面
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-5",
  )

  box.create_post!(
    content:
  """产品详情页面
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-02-4",
  )

  box.create_post!(
    content:
  """截止今天, BoxesActivity和BoxActivity基本完成, 通过这两个activity搭建好了底层: 网络层, Event, 图片加载, Activity基类等
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-31",
  )

  box.create_post!(
    content:
  """这两天一直在调研github上的朋友圈项目, 以及一些可能用到的库
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-26",
  )

  box.create_post!(
    content:
  """继续udacity的 #Android 应用开发 Android 基础知识# 课程, 最后一节, 十二节
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-24",
  )

  box.create_post!(
    content:
  """继续udacity的 #Android 应用开发 Android 基础知识# 课程, 跳过第七八九节, 直接看第十, 十一节
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-23",
  )

  box.create_post!(
    content:
  """继续udacity的 #Android 应用开发 Android 基础知识# 课程, 第五, 六节
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-22",
  )

  box.create_post!(
    content:
  """继续udacity的 #Android 应用开发 Android 基础知识# 课程, 第三, 四节
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-21",
  )

  box.create_post!(
    content:
  """开始开发android, 在udacity上找到 #Android 应用开发 Android 基础知识# 课程, 从头看一遍. 
  课程共12节, 今天看前两节
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-20",
  )

  # 添加的时候, 按照created_at倒序
  box.create_post!(
    content:
  """给小程序的各个页面增加分享功能
  """,
    images: [
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/4145e075f9f8b596d48aa06769c964b9.png"
    ],
    mini_program: true,
    created_at: "2018-01-19",
  )

  box.create_post!(
    content:
  """小程序增加详情页面
  """,
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/e8e1074931cfe8d00963ff1ce1851b6a.jpg"
    ],
    mini_program: true,
    created_at: "2018-01-19",
  )

  box.create_post!(
    content:
  """服务端给post增加copy接口
  """,
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/b220150a36331c61638406bcf3053810.jpg"
    ],
    mini_program: true,
    created_at: "2018-01-19",
  )

  box.create_post!(
    content:
  """小程序和服务端联调, 调通各个api接口
  """,
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
      "http://cdn.draftbox.cn/1/1d2c789d51a570de4adbec226bbec63b.jpg",
      "http://cdn.draftbox.cn/1/bc21426085b439f24ba484a56638f6ed.jpg"
    ],
    mini_program: true,
    created_at: "2018-01-18",
  )

  box.create_post!(
    content:
  """测试一下emoji...
  😬😑😐😶😱😆❤️🚘🚖➢✪☞☛€¥¢®©&⅋🀌🀍🀎‰‱
  """,
    images: [
    ],
    mini_program: true,
    created_at: "2018-01-18",
  )

  box.create_post!(
    content:
  """小程序的开发完成页面的上拉加载和下拉刷新
  服务端丰富seed数据, 并部署到服务器上
  """,
    images: [
      "http://cdn.draftbox.cn/1/a4481ce8b99a20d035ac21b1545768a1.png",
      "http://cdn.draftbox.cn/1/9e6dac9b62de946e604b51c9ea784c5d.jpg",
    ],
    mini_program: true,
    created_at: "2018-01-18"
  )

  box.create_post!(
    content:
  """开始小程序的开发, 小程序打算有2个主要页面:
  1.草稿箱详情页面, 显示用户的草稿箱里点亮小程序图标的草稿
  2.图片详情(也可能不做)
  """,
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
    created_at: "2018-01-17"
  )

  box.create_post!(
    content:
  """服务端的单元测试和seed data
  """,
    images: [
      "http://cdn.draftbox.cn/1/72633aa2fca711f716d9427ed048318a.png"
    ],
    mini_program: true,
    created_at: "2018-01-16"
  )

  box.create_post!(
    content: 
  """继续服务端开发:
  1.登录登出的controller
  2.box和post的controller
  2.jbuilder
  """,
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
  created_at: "2018-01-15"
  )

  box.create_post!(
    content: 
  """今天开始实现服务端, 采用rails api only, 想用Elixir Phoenix. 但考虑到时间问题, 先用rails, 以后用Phoenix重写.
  1.项目搭建
  2.数据结构
  """,
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
    created_at: "2018-01-14"
  )

  box.create_post!(
    content: 
  """今天的完善了原型图的菜单和细节, 主要包括:
  1.我的草稿箱二维码
  2.我的小程序码
  3.扫码添加草稿箱
  4.点亮小程序图标
  5.复制草稿
  """,
    images: [
      "http://cdn.draftbox.cn/1/9ef424cf1b898d11da79aaebcdf994cd.jpg"
    ],
    mini_program: true,
    created_at: "2018-01-13"
  )

  box.create_post!(
    content: 
  """今天开始着手原型图设计, 参考`知识星球`和`轻芒阅读`, 核心功能只有5个界面:
  1.首页, 列出所有的草稿箱.
  2.草稿箱详情页.
  3.草稿新建和编辑页面.
  4.关注我的
  5.二维码和小程序码
  """,
    images: [
      "http://cdn.draftbox.cn/1/46e74d705da89b0b01701b509b19a8f7.png"
    ],
    mini_program: true,
    created_at: "2018-01-12"
  )
end