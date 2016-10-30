class Organizacao < ActiveRecord::Base
  has_many :projetos
  has_many :users
  has_many :checklists
  
  has_many :invites

  mount_uploader :picture, PictureUploader

  validate :picture_size

  def to_s
    nome
  end

  private
  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, "imagem deve ser menor que 2Mb")
    end
  end


end
