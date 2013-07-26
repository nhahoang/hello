class Author < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name, presence: true

  has_many :books, dependent: :destroy
end
