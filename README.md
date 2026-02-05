# BlogPost

A beautiful, modern blog application built with Ruby on Rails and Bulma CSS framework.

## Features

- ✨ Modern, responsive UI with Bulma CSS
- 📝 Create, read, update, and delete blog posts
- 👤 Author attribution for each post
- 🎨 Beautiful card-based layout
- 📱 Fully responsive design
- ⚡ Fast and lightweight

## Requirements

- Ruby 3.2.3
- Rails 7.0.3+
- SQLite3

## Setup

1. Install dependencies:
```bash
bundle install
```

2. Create and migrate the database:
```bash
rails db:create
rails db:migrate
```

3. (Optional) Seed the database with sample data:
```bash
rails db:seed
```

4. Start the server:
```bash
rails server
```

5. Visit `http://localhost:3000` in your browser

## Usage

- **View all posts**: Navigate to the home page to see all blog posts
- **Create a post**: Click "New Post" in the navigation bar
- **Edit a post**: Click "Edit" on any post card or post detail page
- **Delete a post**: Click "Delete" and confirm the action
- **Read a post**: Click on any post title or "Read More" button

## Technologies Used

- **Ruby on Rails 7.0** - Web framework
- **Bulma CSS** - Modern CSS framework
- **Simple Form** - Form builder
- **Turbo** - SPA-like page acceleration
- **Stimulus** - JavaScript framework
- **SQLite3** - Database

## License

This project is open source and available under the MIT License.

