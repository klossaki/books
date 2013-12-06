class Book < ActiveRecord::Base
  attr_accessible :ISBN_10, :ISBN_13, :author_id, :title

  belongs_to :author

  validates :ISBN_10, :presence => true,  uniqueness: true, length: {is: 10}, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => false}
  validates :ISBN_13, :presence => true,  uniqueness: true, length: {is: 13}, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => false}
  before_save :unique_ISBN_numbers

  default_scope self.order("rank DESC")

  def unique_ISBN_numbers
    if Book.find_by_ISBN_10_and_ISBN_13(self.ISBN_10, self.ISBN_13).present?
      errors.add(:base, "the ISBN number has already been taken")
    end
  end
end
