class Image < ActiveRecord::Base
  mount_uploader :file_name, ImagesUploader
  belongs_to :galery

  validates_presence_of :file_name
end
