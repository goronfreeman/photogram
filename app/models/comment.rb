class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
