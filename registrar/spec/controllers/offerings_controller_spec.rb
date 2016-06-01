require 'rails_helper'

RSpec.describe OfferingsController, :type => :controller do
    before :each do
            @c1 = Course.create({department: "COM", course_number: "1300C", title: "Introduction to Computer Science"})
            @offering = Offering.create({semester: 0, location: "Furst 312", section: 241, professor_last_name: "Kelly", spots_available: 15, crn: 33561, course_id: @c1.id})
    end
    describe 'displaying a list of course offerings matching a given search criterion' do
        it 'should query the database' do
            Offering.should_receive(:joins).and_return(Offering.all)
            get :display, {:professor_last_name => 'Kelly'}
        end
    end
    describe 'enrolling in an offering' do
        before :each do
            Offering.stub(:find_by).and_return(@offering)
            @original_spots_available = @offering.spots_available
        end
        it 'should access the given offering' do
            post :enroll, {:crn => 33565}
        end
        context 'afterwards'
            before :each do
                @offering = Offering.create({semester: 0, location: "Furst 312", section: 241, professor_last_name: "Kelly", spots_available: 14, crn: 33561, course_id: @c1.id})
            end
            it 'should change the state of the offering' do
                @offering.spots_available.should_not equal(@original_spots_available)
            end
            it 'should decrease the spots available by one' do
                @offering.spots_available.should be(@original_spots_available - 1)
            end
    end
end
