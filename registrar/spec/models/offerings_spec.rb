require 'rails_helper'

RSpec.describe Offering, :type => :model do
    describe "creation" do
        it 'should set semester to the proper int corresponding to the string input' do
            c1 = Course.create({department: "COM", course_number: "1300C", title: "Introduction to Computer Science"})
            o1 = Offering.create({semester: "Fall", location: "Furst 312", section: 241, professor_last_name: "Kelly", spots_available: 15, crn: 33561, course_id: c1.id})
            o1.semester.should equal?(0)
        end
    end
end
