class Application < ActiveRecord::Base
	belongs_to :user
	has_many :events

	validates :name, length: {minimum: 3}
	validates :url, uniqueness: true



end
