require 'pry'



class Song < ApplicationRecord
    validates :title, presence: true
    validate :released_yet
    validate :future_but_released
    validate :bieber

    def released_yet
        if release_year == nil && released == true
            errors.add(:release_year, "oops")
        end
    end

    def future_but_released
        if release_year && release_year > Date.today.year
            errors.add(:release_year, "oops")
        end
    end

    def bieber
        if Song.all.none? { |s| s.title == title && s.release_year == release_year } == false
            errors.add(:release_year, "oops")
        end
    end
end
