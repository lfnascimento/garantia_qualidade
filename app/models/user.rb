class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :projeto
  belongs_to :organizacao

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :checar_qa_e_avaliado
  validates :nome, presence: true
  # validates :email, format: {with: VALID_EMAIL_REGEX}

  def sepg?
    self.papel == "SEPG"
  end

  def qa?
    self.papel == "QA"
  end

  def to_s
    "#{nome} - #{email}"
  end

  def self.find_all_by_organizacao(id)
    self.all.where(organizacao: id)
  end

  def checar_qa_e_avaliado
    if qa? && avaliado?
      errors.add(:papel, '- O usuário não pode ter o perfil de QA e ao mesmo tempo ser avaliado')
    end
  end

end
