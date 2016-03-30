class Article < ActiveRecord::Base

  validates_presence_of :status, :text

end
