# == Schema Information
#
# Table name: posts
#
#  id         :uuid             not null, primary key
#  body       :text
#  tagline    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
    belongs_to :user
end
