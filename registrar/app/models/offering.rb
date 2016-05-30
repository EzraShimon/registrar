class Offering < ActiveRecord::Base
    belongs_to :course
    enum semester: {
        fall: 0,
        spring: 1,
        summer: 2
    }
end
