class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :projeto

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def sepg?
    self.papel == "SEPG"
  end

  def qa?
    self.papel == "QA"
  end

  def to_s
    nome
  end
end
