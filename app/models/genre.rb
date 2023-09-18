class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  def genre_display
   '--選択してください--' + name 
  end
  
end
