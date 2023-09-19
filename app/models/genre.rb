class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  def genre_display
   '--選択してください--' + name 
  end
  
   validates :name, presence: true
end
