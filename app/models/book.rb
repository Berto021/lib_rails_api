class Book < ApplicationRecord
  enum status: { want_read: 0, reading: 1, read: 2 }

  validates :title, :author, presence: true
  validates :rating, inclusion:{in: 1..5}, allow_nil: true
end
