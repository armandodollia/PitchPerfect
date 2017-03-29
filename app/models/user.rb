class User < ApplicationRecord
  has_secure_password
  has_many :votes, foreign_key: :voter_id
  has_many :pitches, foreign_key: :author_id
  belongs_to :team, class_name: 'Pitch', optional: true

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
end
