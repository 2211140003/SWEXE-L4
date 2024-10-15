class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :pass, presence: true

  # パスワードのセッター
  def pass=(new_password)
    self[:pass] = BCrypt::Password.create(new_password)
  end
end
