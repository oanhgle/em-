# Backend for this repo
https://github.com/yenhle/em-backend

# Emnet

Using Solana blockchain, Emnet is a tokenized network that aims to create a Bull community by rewarding users with an active stake in itself per `$BULLCOIN$`.

## 🤔 What it does

Feel closer to yourself and the community around you with Emnet. This iOS app utilizes cutting-edge blockchain technology to rewards users for their engagement in USF campus events and their commitment to personal growth through writing journals. 

### Connecting with the community

Self-care isn't enough. We need community care to thrive. Our goal is to create a space where people can take ownership of their efforts to strengthen communities. A community contribution can take many forms; it can be as simple as attending an event on campus to share your vision, goals, or skills with others. With Emnet, users can see what events are taking place on USF campus and earn `$BULLCOIN$` for attending them. Users will be able to redeem `$BULLCOIN$` for a variety of exciting rewards, such as discounts on goods and services on USF's campus. Users can also trade tokens with each other.

### Connecting with yourself through journaling

In addition to taking ownership of building the community, we want users to feel appreciated for taking care of their own mental health. Studies have shown that journaling can reduce the frequency of intrusive, depressive thoughts, help college students who are vulnerable to depression, and reduce overall levels of depression in those diagnosed with a Major Depressive Disorder.  With Emnet, users can maximize the benefit of self-reflection through journaling and gain `$BULLCOIN$`.

### Interactive Map

The app provides an interactive map that shows the community's well-being status, what they have been up to, and how they are feeling. With Natural Language Processing, we classify their emotional state through their journals and add emoticons that represent their mood. All you see are the emoticons, not their profile. It's totally anonymous, and each status is only up for 24 hours!

## 💻 How we built it

Our app incentive system is built on the Solana blockchain, providing users with secure and transparent `$BULLCOIN$` tokens that can be redeemed for variety of exciting rewards such as discount on services and goods in USF campus area (or anything that promote community involvements).

The backend of the app is built using Python and Flask, hosting on CockroachDB server"less". We use password hashing to secure user's password and encryption algorthim to secure user's public key for veryfing transaction on Solona network. 

The front end of the app is built with Swift. We utilize SwiftUI for most of the interface. In addition, we use iOS MapKit and CoreLocation to display the map, get user's current location and pin their emoticons

To connect backend to the frontend, we create rest APIs with Flask-SQLAlchemy and call the API endpoints through HTTP request in Swift. 

We also use NLP to classify the user's emotional situation through journaling... // fixme

## 😭 Challenges we ran into

This is our first time interacting with blockchain technology to develop a native mobile app. We ran into some difficulties trying to create and send tokens with Solana. We also ran into challenges where we connect front end to backend. Though some of us are familiar with Flask and Swift, we never try to combine them before. Our two backend developers also have two separate backend files that are not really compatible. We were not able to merge them due to the time constraint, but we figured out the solution to run the demo by running two ports at the same time.

## 📌 Accomplishment

By utilizing the current modern technologies such as Solana, Swift, Flask, SQLAlchemy, and NLP, we are proud to create a solution that helps strengthen the USF community

## 📝 Roadmap
Some future implementations include:
- Generate smart recommendations to recommend users their potential favorite events and mental health resources based on their journaling history
- Deploy the app on Android
- Letting users earn tokens with a peer support system
