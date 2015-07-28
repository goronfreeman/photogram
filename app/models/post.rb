class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :image, presence: true

  has_attached_file :image, styles: { medium: '640x' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  caption            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  user_id            :integer
#
