class Landing < ActiveRecord::Base
    belongs_to :starship
    belongs_to :planet
end