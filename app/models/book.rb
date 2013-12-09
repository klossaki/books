class Book < ActiveRecord::Base
  attr_accessible :ISBN_10, :ISBN_13, :author_id, :title, :user_id, :rank

  belongs_to :author
  belongs_to :user

validates_presence_of :title
  validates :ISBN_10, :presence => true,  uniqueness: true, length: {is: 10}, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => false}
  validates :ISBN_13, :presence => true,  uniqueness: true, length: {is: 13}, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => false}
  validates :rank, :presence => true, length: {is: 4}, :numericality => {:greater_than_or_equal_to => 0, :allow_nil => false}
  
  before_save :unique_ISBN_numbers

  ##
  # Order by rank then title

  default_scope self.order("rank ASC")

  ## 
  # TODO: Add a ruby interpolation method so that the ISBN #'s can be displayed along with the msg.

  def unique_ISBN_numbers
    if Book.find_by_ISBN_10_and_ISBN_13(self.ISBN_10, self.ISBN_13).present?
      errors.add(:base, "the ISBN number has already been taken")
    end
  end

end
