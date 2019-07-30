Message.destroy_all
User.destroy_all

one = User.create(name: "Human One")
two = User.create(name: "Human Two")

Message.create(content: "This is a chat message!", sender: one, receiver: two)
Message.create(content: "Wow! So is this!", sender: two, receiver: one)
Message.create(content: "This is super great!", sender: one, receiver: two)