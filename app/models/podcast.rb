class Podcast < ActiveRecord::Base

  has_attached_file :screenshot, 
                    :styles => { 
                    :large => ["345x267!", :png], 
                    :small => ["150x116!", :png] },
                    :path => ":rails_root/public/images/screenshots/:style/:id.:extension",
                    :url => "/images/:attachment/:style/:id.:extension",
                    :default_style => :large
  validates_presence_of :name, :description, :movie_link
  
  validates_attachment_presence :screenshot, :message => "is missing"
  validates_attachment_content_type :screenshot,
                                    :content_type => ["image/jpeg", "image/jpg", "image/png", "image/gif"],
                                    :message => "must be a GIF, JPEG, or PNG"

end
