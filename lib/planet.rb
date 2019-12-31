class Planet < ActiveRecord::Base
    has_many :landings
    has_many :starships, through: :landings

end