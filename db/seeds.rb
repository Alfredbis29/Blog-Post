# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Post.destroy_all

Post.create!([
  {
    title: "Welcome to BlogPost!",
    author: "Admin",
    content: "Welcome to our new blog platform! This is a simple yet powerful blogging application built with Ruby on Rails and Bulma CSS. You can create, edit, and delete posts with ease. The interface is clean, modern, and fully responsive, so it works great on any device. Start writing your thoughts and share them with the world!"
  },
  {
    title: "Getting Started with Rails",
    author: "Jane Developer",
    content: "Ruby on Rails is a fantastic web framework that makes building web applications a joy. With its convention over configuration philosophy, you can build powerful applications quickly. Rails follows the MVC (Model-View-Controller) pattern, which helps organize your code and makes it easier to maintain. Whether you're building a simple blog or a complex web application, Rails has the tools you need."
  },
  {
    title: "The Beauty of Bulma CSS",
    author: "Design Enthusiast",
    content: "Bulma is a modern CSS framework based on Flexbox. It's lightweight, easy to use, and doesn't require JavaScript. With Bulma, you can create beautiful, responsive interfaces quickly. The framework provides a comprehensive set of components and utilities that follow modern design principles. Best of all, it's completely free and open source!"
  },
  {
    title: "Tips for Better Blogging",
    author: "Content Creator",
    content: "Writing great blog posts takes practice, but here are some tips to get you started: 1) Write about what you know and love, 2) Keep your content clear and engaging, 3) Use headings and formatting to make your posts scannable, 4) Add personal stories and examples, 5) Edit and proofread before publishing. Remember, the best blog posts provide value to your readers while expressing your unique voice."
  }
])

puts "Created #{Post.count} sample posts!"
