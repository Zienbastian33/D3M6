# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Crear usuarios
10.times do
    User.create!(
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    )
  end
  
  # Crear posts
  User.all.each do |user|
    5.times do
      user.posts.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.paragraph(sentence_count: 2)
      )
    end
  end
  
  # Crear comentarios
  Post.all.each do |post|
    3.times do
      post.comments.create!(
        content: Faker::Lorem.paragraph(sentence_count: 2),
        user_id: User.pluck(:id).sample
      )
    end
  end
  
  # Crear reacciones
  kinds = %w[like dislike]
  Post.all.each do |post|
    3.times do
      post.reactions.create!(
        kind: kinds.sample,
        user_id: User.pluck(:id).sample
      )
    end
  end
  