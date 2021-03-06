class EmployerPhoto < ActiveRecord::Base
  attr_accessible :caption, :employer_id, :photo_url, :photo_name, :photo, :updated_at
  belongs_to :employer
  mount_uploader :photo, PhotoUploader
#   scope :records_since, lambda { |time| where("updated_at < ?", time) }


def photo_url
  	photo.url.to_s
end

def photo_name
  	name_strip photo.url.to_s
end


def name_strip url
	 /(\/\d+\/)(.*\.png)/.match(url)[2].to_s if /(\/\d+\/)(.*\.png)/.match(url)
end

  def self.records_since(time)
    where("created_at > ?", time)
  end

end
