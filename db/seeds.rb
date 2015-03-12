# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

messages = [
	{
		message: "Give me liberty, or give me death!",
		author: "Patrick Henry"
	},
	    message: "THE LAW, IN ITS MAJESTIC EQUALITY, FORBIDS THE RICH AS WELL AS THE POOR, TO SLEEP UNDER BRIDGES, TO BEG IN THE STREETS, AND TO STEAL BREAD.",
	    author: "Anatole France"
]

messages.each do |m|
	Message.create(m)
end
