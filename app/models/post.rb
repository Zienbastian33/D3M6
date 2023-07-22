class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze
end