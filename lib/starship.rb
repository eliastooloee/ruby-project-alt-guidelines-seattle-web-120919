class Starship < ActiveRecord::Base
    has_many :landings
    has_many :planets, through: :landings 

end