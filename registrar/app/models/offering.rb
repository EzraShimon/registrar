class Offering < ActiveRecord::Base
    belongs_to :course
    enum semester: {
        Fall: 0,
        Spring: 1,
        Summer: 2
    }
end
