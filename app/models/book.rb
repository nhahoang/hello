class Book < ActiveRecord::Base
  attr_accessible :author_id, :category_id, :title, :year, :pic

  validates :author_id, :category_id, :title, :year, presence: true
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  belongs_to :author
  belongs_to :category

  def self.search(search)
    if search
      return Book.joins(:author).where(["title like :key or authors.name like :key", {:key => "%#{search}%"}])
      #return Book.joins(:author).where(["title like ? or authors.name like ?", "%#{search}%", "%#{search}%"])
    else
      return Book.all
    end
  end

end
