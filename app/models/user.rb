class User < ApplicationRecord
  has_many :papers
  has_many :exams

  before_save {self.email=email.downcase}
  validates :name, presence:true, length:{maximum:50}
  # #VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a=z]+\z/i
  # validates :email,presence:true,length:{maximum:255},
  # 					#format:{with:VALID_EMAIL_REGEX},
  # 					uniqueness:{case_sensitive:false}
  has_secure_password
  # validates :password,presence:true,length:{minimum:6}

  enum role: {student: 0, teacher: 1, admin: 2}
  enum status: {enable: 0, disable: 1}
end
