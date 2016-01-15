# User.destroy_all
#
# User.create!({
#   username: "Cameron",
#   password_digest: "fry",
#   email: "cameronfry11@gmail.com"
# },
# {
#   username: "Jeff",
#   password_digest: "a",
#   email: "jeff@yahoo.com"
# },
# {
#   username: "Lynn",
#   password_digest: "lenny",
#   email: "Lynn@yahoo.com"
# })
#
# p "Created #{User.count} users"
#
Form.destroy_all

Form.create!([{
  title: "weekly",
  category: "planning",
},
{
  title: "political blog",
  category: "blog",
},
{
  title: "tax essays",
  category: "essay",
}])

p "Created #{Form.count} form s"

Question.destroy_all

Question.create!([{
  text: "What 3 major things did you accomplish last week?",
  answer: "I ran a marathon, walked my dog, and ate a hot dog.",
  form_id: Form.first.id
},
{
  text: "List the 3 most important goals for this next week",
  answer: "I want to run a 5k, row a boat, and vanquish voldemort",
  form_id: Form.last.id
},
{
  text: "Who is your audience this week?",
  answer: "I'm speaking to a group of teengers",
  form_id: Form.all[1].id
}])

p "Created #{Question.count} questions"

Draft.destroy_all

Draft.create!([{
  title: "Week of May 22nd Plan",
  text: "I accomplished a blog post win, won a volleyball tournament, and wrote a song. I'm planning on running a 5k this next week, delivering my specs on a certain project and speaking with the president of University about the scholarship",
  form_id: Form.first.id
},
{
  title: "The next president in 2016",
  text: "I accomplished a blog post win, won a volleyball tournament, and wrote a song. I'm planning on running a 5k this next week, delivering my specs on a certain project and speaking with the president of University about the scholarship",
  form_id: Form.last.id
},
{
  title: "Taxes are too high",
  text: "draft text here as a response to questions above",
  form_id: Form.first.id
}])

p "Created #{Draft.count} drafts"
