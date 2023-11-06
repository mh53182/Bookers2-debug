class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == "perfect"
      Book.where('title = ? OR body = ?', content, content)
    elsif method == "forward"
      Book.where('title LIKE ? OR body LIKE ?', content + '%',content + '%')
    elsif method == "backward"
      Book.where('title LIKE ? OR body LIKE ?', '%' + content,'%' + content)
    else
      Book.where('title LIKE ? OR body LIKE ?', '%' + content + '%','%' + content + '%')
    end
  end
  # 複数カラムを検索対象としてORで繋ぐ場合、検索フォームから送られてくるデータの受け口も検索対象と同じだけ必要。

end
