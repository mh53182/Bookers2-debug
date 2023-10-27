class Relationship < ApplicationRecord
  
# follower_id はフォローするユーザーのID　フォローされる側から見た"フォロワー"
  belongs_to :follower, class_name: "User"
# followed_id はフォローされるユーザーのID
  belongs_to :followed, class_name: "User"
  
# ここはリレーションシップモデルなので両方belongs_to。多分。
  
end
