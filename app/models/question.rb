class Question < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  	belongs_to :user
	has_many :likes

	letsrate_rateable "text", "text1", "text2", "text3"
	
end
