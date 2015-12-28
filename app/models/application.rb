class Application < ActiveRecord::Base
	belongs_to :user

	validates :name, length: {minimum: 3}
	validates :url, uniqueness: true
end
