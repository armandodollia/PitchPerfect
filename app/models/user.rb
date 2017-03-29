class User < ApplicationRecord
  has_secure_password
  has_many :votes, foreign_key: :voter_id
  has_many :pitches, foreign_key: :author_id
  belongs_to :team, class_name: 'Pitch'
end
