# Makers Week 2
## Oystercard Challenge

#### Introduction

This week's challenge was to replicate London's Oyster travelcard system using object-oriented design in Ruby. User's should be able to create a card, that should be able to topped up to no more than £90. They should be able to touch in and touch out of a station, and doing so should charge the card a fee, dependent on the zone of the station, although this functionality is not yet implemented, and the card simply deducts a minimum fare of £1. Each journey, with an entry and exit station, should be added to a journey log, accessible through the card. If a user touches in without touching out, or touches out without touching in, the journey log should log an incomplete journey, and the user should be charged a penalty fare.

For more information, see the original [challenge instructions](https://github.com/makersacademy/course/blob/master/oystercard/README.md).

The challenge was designed to get students to think about domain modelling, classes, and the single responsibility principle.


#### Running the application

This is a command line application. To run it, simply open a terminal and require the files.


#### Challenges

One of the biggest challenges of this set of exercises was the responsibilities of each class and the interaction between them. This initially started off well, but as classes grew, I extracted methods and responsibilities to the wrong places, and ended up with a messy codebase. This was down to a lack of on-paper planning and modelling the domain before diving into the code. 
