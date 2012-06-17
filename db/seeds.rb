# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new({ name: 'Terry Tai', email: 'poshboytl@gmail.com', provider: 'github',
                   uid: '5960', admin: true
                   })

admin.episodes.new({ name: "Rails Tutorial", permalink: 'rails-tutorial', description: '通过一个极简单的博客例子，展示一些基本的Ruby on Rails特性和开发方法。',
                     notes: '涉及的一些代码:\r\n\r\nPost Model:\r\n``` ruby\r\nclass Post < ActiveRecord::Base\r\n  validates :title, :presence => true, :uniqueness => true\r\n  validates :content, :presence => true\r\n\r\n  has_many :comments\r\nend\r\n```\r\n\r\nComment Model:\r\n``` ruby\r\nclass Comment < ActiveRecord::Base\r\n  belongs_to :post\r\nend\r\n```\r\nComments Controller:\r\n\r\n``` ruby\r\nclass CommentsController < ApplicationController\r\n  def create\r\n    @post = Post.find(params[:post_id])\r\n    @comment = @post.comments.new(params[:comment])\r\n    redirect_to @post if @comment.save\r\n  end\r\nend\r\n```',
                     published_at: "2011-12-11 08:00:00", seconds: 1860
                      })

admin.episodes.new({ name: 'User Authentication', permalink: 'user-authentication', description: '在不使用任何现成Authentication gem的前提下，建立一个简单灵活的用户验证机制。本期内容是基于第一期Blog例子。',
                     notes: 'Create User migration:\r\n``` db/migrate/20111214073443_create_users.rb\r\nclass CreateUsers < ActiveRecord::Migration\r\n  def change\r\n    create_table :users do |t|\r\n      t.string :login\r\n      t.string :hashed_password\r\n      t.string :salt\r\n\r\n      t.timestamps\r\n    end\r\n  end\r\nend\r\n\r\n```\r\n\r\nUser 模型:\r\n``` app/models/user.rb\r\nclass User < ActiveRecord::Base\r\n  validates :login, :presence => true\r\n  \r\n  def password\r\n    @password\r\n  end\r\n  \r\n  def password=(pass)\r\n    return unless pass\r\n    @password = pass\r\n    generate_password(pass)\r\n  end\r\n  \r\n\r\n  # 此处用动词形式(authenticate)更加合适, 特此说明一下. 感谢 Chen Kai 同学的提醒.\r\n  def self.authentication(login, password)\r\n    user = User.find_by_login(login)\r\n    if user && Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password\r\n      return user\r\n    end\r\n    false\r\n  end\r\n  \r\n  private\r\n  def generate_password(pass)\r\n    salt = Array.new(10){rand(1024).to_s(36)}.join\r\n    self.salt, self.hashed_password = \r\n      salt, Digest::SHA256.hexdigest(pass + salt)\r\n  end\r\nend\r\n```\r\n\r\nSessions 控制器：\r\n\r\n``` app/controllers/sessions_controller.rb\r\nclass SessionsController < ApplicationController\r\n  def new\r\n  end\r\n  \r\n  def create\r\n    @user = User.authentication(params[:login], params[:password])\r\n    if @user\r\n      session[:user_id] = @user.id\r\n      flash[:notice] = \"Weclome \#{@user.login}\"\r\n      redirect_to posts_path\r\n    else\r\n      flash[:notice] = \"The login or password is not correct.\"\r\n      redirect_to new_session_path\r\n    end\r\n  end\r\nend\r\n```\r\n\r\n登陆页面\r\n``` app/views/sessions/new.html.erb\r\n<h1>Admin Login</h1>\r\n<%= form_tag sessions_path do -%>\r\n  <label for=\"login\">Login</label>\r\n  <%= text_field_tag :login, params[:login] %>\r\n  <label for=\"password\">Password</label>\r\n  <%= password_field_tag :password, params[:password] %>\r\n  \r\n  <%= submit_tag \"Login\"%>\r\n<% end %>\r\n```\r\n\r\n',
                     published_at: '2011-12-14 08:00:00', seconds: 1260
                   })

admin.episodes.new({ name: 'Omniauth 1', permalink: 'omniauth-1', description: '介绍如何使用OmniAuth来做基于第三方服务的认证。',
                     notes: "Gemfile:\r\n\r\n```Gemfile\r\ngem 'omniauth'\r\ngem 'omniauth-github'\r\n```\r\n\r\n初始化OmniAuth:\r\n\r\n```config/initializers/omniauth.rb\r\nRails.application.config.middleware.use OmniAuth::Builder do\r\n  provider :github, 'd78181e1ec709f32d844',\r\n    '7fd79b37dd8a4423c5989b6ae6d4fe358af11dc'\r\nend\r\n```\r\n\r\n路由:\r\n```config/routes.rb\r\nmatch \"/auth/:provider/callback\", :to => 'sessions#create'\r\n```\r\n\r\nUser model(这段代码会在下一期进行重构，具体原因请看视",
                     published_at: '2011-12-25 20:15:44', seconds: 1260
                   })

admin.episodes.new({ name: 'Omniauth 1', permalink: 'omniauth-1', description: '介绍如何使用OmniAuth来做基于第三方服务的认证。',
                     notes: "Gemfile:\r\n\r\n```Gemfile\r\ngem 'omniauth'\r\ngem 'omniauth-github'\r\n```\r\n\r\n初始化OmniAuth:\r\n\r\n```config/initializers/omniauth.rb\r\nRails.application.config.middleware.use OmniAuth::Builder do\r\n  provider :github, 'd78181e1ec709f32d844',\r\n    '7fd79b37dd8a4423c5989b6ae6d4fe358af11dc'\r\nend\r\n```\r\n\r\n路由:\r\n```config/routes.rb\r\nmatch \"/auth/:provider/callback\", :to => 'sessions#create'\r\n```\r\n\r\nUser model(这段代码会在下一期进行重构，具体原因请看视",
                     published_at: '2011-12-25 20:15:44', seconds: 1260
                   })
admin.save!
