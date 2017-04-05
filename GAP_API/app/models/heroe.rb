class Heroe < ApplicationRecord
	belongs_to :universe, optional: true
end
