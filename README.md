[![Code Climate](https://codeclimate.com/github/chrisyoung/heckson/badges/gpa.svg)](https://codeclimate.com/github/chrisyoung/heckson)

# Heckson
Isolate your domain and make it the center of your programming world.  Use Heckson to generate a Containerized Domain Model that can be driven by your frameworks and included in your apps.

## Why we need domains
We need to organize our thoughts to become faster the more we understand, not slower.

## Domain Driven Design
[Domain Driven Design](http://domainlanguage.com/ddd/reference/)

## Hexagonal Architecture
[Hexagonal Architecture](http://alistair.cockburn.us/Hexagonal+architecture)

## Domain Driven Hexagons (of pure love)
* Domains make it meaningful (Business Language is self sustaining and resolvable)
* Hexagons make it portable and pluggable (think containers).

## Pizza Server
We developed PizzaServer at Tanga as a simple application that we could use to evaluate new recruits.  The simple domain made it easy to extend with these concepts in a very iterative fashion.  

## Pizza Domain
You might prefer a whiteboard to ASCII, but this gets the idea across :)
```
┌───────────────────────Pizzas Domain────────────────────────┐
│                                                            │
│ ┌───────────────────Aggregate Modules───────────────────┐  │
│ │                                                       │  │
│ │  ┌─────────────────────Pizzas──────────────────────┐  │  │
│ │  │                                                 │  │  │
│ │  │                   ┌────────┐                    │  │  │
│ │  │                   │ Pizza  │                    │  │  │
│ │  │              ◎────│ -----  │                    │  │  │
│ │  │                   │  Name  │                    │  │  │
│ │  │                   └────────┘                    │  │  │
│ │  │                        *                        │  │  │
│ │  │                        ┃                        │  │  │
│ │  │                        ▼                        │  │  │
│ │  │                   ┌────────┐                    │  │  │
│ │  │                   │Topping │                    │  │  │
│ │  │                   │------- │                    │  │  │
│ │  │                   │  Name  │                    │  │  │
│ │  │                   └────────┘                    │  │  │
│ │  │                                                 │  │  │
│ │  │  * A Pizza is the head of the Pizzas aggregate  │  │  │
│ │  │  * A Pizza is an entity                         │  │  │
│ │  │  * A Pizza has a name                           │  │  │
│ │  │  * A Pizza has many Toppings                    │  │  │
│ │  │  * A Topping is a value object                  │  │  │
│ │  │  * A Topping has a name                         │  │  │
│ │  └─────────────────────────────────────────────────┘  │  │
│ └───────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────┘
                                         ◎── = Aggregate Head
```
Note: This diagram was created by a cool tool called [Monodraw](http://monodraw.helftone.com/)

## Usage - Developing the Pizza Domain with Heckson

### 1. Generate a hexagon to hold the Domain
`$ heckson new pizza_hexagon`
### 1. Generate a Pizzas Aggregate with a Pizza entity for the head
```
$ cd pizza_hexagon
$ heckson aggregate pizzas --h pizza --a name:string toppings:[topping] description:description
```
### 1. Generate a Topping Value object
`$ heckson value_object pizza -m pizzas --a name:string`
### 1. Generate an HTTP adapter
`$ heckson adapter http`
### 1. Run the server
```
$ cd lib/adapters/http
$ rackup config.ru
```

### 1. Make pizzas!
```
curl -H "Content-Type: application/json" -X POST -d  '{"name":"White Pizza", "description":"No red sauce", "toppings":[{"name":"chicken"}]}' http://localhost:9292/pizzas
```

#### UPDATE
```
curl  -H "Content-Type: application/json" -X PUT -d  '{"attributes":{"name":"chris", "toppings":[{"name":"pepperoni2"}]}}' http://localhost:4567/pizzas/1
```

## Developing with Hexagons and Rails
### 1. Create a PizzaHexagon Gem
### 2. Hook up to Rails Resources

## Domain Driven Design Key Concepts
* Aggregates
* Entities
* Values
* Repositories
* Commands

## Hexagonal Architecture Key Concepts
* Hexagon
* Ports (driver and driven)
* Port Adapters
* Mock Database (in-memory)

## Features
* Supports CRUD Commands out of the box
*

## Ports
  Ports and adapters are used to organize services that may be provided by your hexagons, such as a web server that supports crud operations on your Domain Modules.
### User Commands (Driver)
  The "native" port of your Hexagon uses Commands that operate with real Domain objects
### Data (Driven)
  By default your hexagon uses a mock database or in-memory repository to persist aggregates

## Adapters
  Adapters fall into two categories, those that can drive a domain and those that are driven by the domain.  Hecks allows you to generate driving adapters like HTTP, JSON, and Validator, as well as driven adapters like SQL, Couch, and SQLDummy(an in memory repository).

### Driving Adapters
#### HTTP
  An http server that provides CRUD access to your Heckson modules.
#### JSON
  An http server that provides CRUD access to your Heckson modules.
#### Validations
  This adapter will provide a client with human friendly feedback when trying to call commands
### Driven Adapters
#### SQL
  Implemented with Active Record, this adapter allows you to persist your aggregates to a SQL database
#### CouchDB
  An object store adapter.  Save your aggregates as object graphs

## How to Meditate

### Method:

Pay attention and relax

### Notes:

Everything happens in the moment
"The moment" is another way of saying "Now".

You are seeing, hearing, smelling, tasting, and breathing right now.
Thoughts are a signal that you are not in the moment.

Pay attention and relax. In the moment, everything is the truth as it is.
Future thinking brings fear, Past thinking brings regret.

So Just right now, what is the truth?
In the morning, it is bright. In the evening, it is dark.
