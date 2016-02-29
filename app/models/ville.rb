class Ville < ActiveRecord::Base
	before_save { self.nom = nom.split(' ').map(&:capitalize).join(' ').split('-').map(&:capitalize).join('-') }
	
	validates :nom, presence: true, uniqueness: true
end