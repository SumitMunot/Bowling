class User < ApplicationRecord
	has_many :casings
	validates :name, presence: true, allow_blank: false
end
