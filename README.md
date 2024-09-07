# Event Ticketing System

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Setup & Installation](#setup--installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Introduction

The **Event Ticketing System** is a web-based application that allows users to browse events, purchase tickets, and manage their bookings easily. Event organizers can create, manage, and sell tickets for events, while admins have access to advanced features to manage the system. 

This application is designed to streamline the event management and ticket purchasing process by providing a user-friendly platform with modern UI and seamless payment integration.

---

## Features

### For Users:
- Browse events by category, date, and location.
- Purchase event tickets with secure checkout.
- View purchased tickets and download them.
- QR code generation for easy event entry.
  
### For Event Organizers:
- Create and manage events with detailed information like date, venue, and ticket pricing.
- Monitor ticket sales and event status.
  
### For Admins:
- Admin dashboard for user, event, and ticket management.
- Role-based access control (Admin, Event Organizer, User).
- Generate reports on event attendance and ticket sales.

---

## Technology Stack

- **Frontend**: Bootstrap, HTML5, CSS3
- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Authentication**: Devise (User Authentication)
- **QR Code Generation**: `rqrcode` gem
- **Deployment**: Heroku / ngrok for testing

---

## Setup & Installation

To set up this project locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/yohannes19/event-ticketing-system.git
    ```
   
2. Navigate to the project directory:
    ```bash
    cd event-ticketing-system
    ```

3. Install dependencies:
    ```bash
    bundle install
    yarn install
    ```

4. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

5. Run the Rails server:
    ```bash
    rails server
    ```

6. Open your browser and navigate to:
    ```
    http://localhost:3000
    ```

---

## Usage

### For Users:
- Register and log in to browse events.
- Click on an event to view details and purchase tickets.
- Access your purchased tickets under your profile.

### For Event Organizers:
- Log in with an organizer account.
- Create new events, set ticket prices, and manage your events.
- View ticket purchases and attendee details.

### For Admins:
- Log in with an admin account.
- Access the dashboard to manage users, events, and tickets.
- Generate and view reports for system-wide activities.

---

## Screenshots

### 1. Home Page
![Home Page](path/to/screenshot1.png)

### 2. Event Details
![Event Details](path/to/screenshot2.png)

### 3. Ticket Purchase Page
![Ticket Purchase](path/to/screenshot3.png)

---

## Future Enhancements

- **Payment Gateway Integration**: Add secure payment options for purchasing tickets.
- **Event Recommendations**: Use a recommendation engine to suggest events based on user interests.
- **Social Media Sharing**: Allow users to share event details directly from the platform.
- **Mobile App**: Develop a mobile version of the platform for both iOS and Android.

---

## Contributing

We welcome contributions to improve this project! Here’s how you can help:
1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Create a new Pull Request.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

