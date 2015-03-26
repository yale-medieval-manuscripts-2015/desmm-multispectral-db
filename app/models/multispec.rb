class Multispec < ActiveRecord::Base
  mount_uploader :file_name, MultispecUploader
end
