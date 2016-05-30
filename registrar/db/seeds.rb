# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Course.delete_all
Offering.delete_all

c1 = Course.create({department: "COM", course_number: "1300C", title: "Introduction to Computer Science"})
Offering.create({semester: 0, location: "Furst 312", section: 241, professor_last_name: "Kelly", spots_available: 15, crn: 33561, course_id: c1.id})
Offering.create({semester: 1, location: "Belfer 215", section: 331, professor_last_name: "Kelly", spots_available: 0, crn: 33562, course_id: c1.id})

c2 = Course.create({department: "COM", course_number: "1300L", title: "Introduction to Computer Science Lab"})
Offering.create({semester: 0, location: "Belfer 1105", section: 261, professor_last_name: "Kelly", spots_available: 5, crn: 33563, course_id: c2.id})
Offering.create({semester: 1, location: "Belfer 1103", section: 361, professor_last_name: "Kelly", spots_available: 2, crn: 33564, course_id: c2.id})

c3 = Course.create({department: "MAT", course_number: "1410", title: "Calculus I"})
Offering.create({semester: 0, location: "Belfer 823", section: 241, professor_last_name: "TBD", spots_available: 20, crn: 33565, course_id: c3.id})
Offering.create({semester: 2, location: "Furst 105", section: 261, professor_last_name: "Lebow", spots_available: 10, crn: 33566, course_id: c3.id})
