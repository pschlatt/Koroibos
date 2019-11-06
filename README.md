# Koroibos [![Build Status](https://travis-ci.com/pschlatt/Koroibos.svg?branch=master)](https://travis-ci.com/pschlatt/Koroibos)

## Author
[Paul Schlattmann](https://github.com/pschlatt)

## Project Description
This project serves as a two day "Coding Challenge" that required building various JSON objects to expose data pertaining to the 2016 Summer Olympics.  I was given a CSV file with over 3000 lines and asked to create and show relationships of this data as it pertains to the endpoints below. 

## Setup 
#### To Test Endpoints Locally
- ```$ git clone https://github.com/pschlatt/Koroibos.git```
- ```$ cd Koroibos```
- ```$ bundle install```
- ```$ rails db:{create,migrate}```
- ```$ rake import```
- Now you're all set to start making calls locally

#### To Run Testing Suite
- ```$ rspec```

If you would like to make these calls to the production server, the url is https://fast-tundra-51600.herokuapp.com/ followed by the uri of the endpoint

## Example Endpoints
#### GET
```/api/v1/olympians```
##### Example Response
```
{
    "olympians": {
        "data": [
            {
                "id": "1",
                "type": "olympian",
                "attributes": {
                    "name": "Andreea Aanei",
                    "team": {
                        "id": 1,
                        "name": "Romania"
                    },
                    "age": 22,
                    "sport": "Weightlifting",
                    "total_medals_won": 0
                }
            },
            {
                "id": "2",
                "type": "olympian",
                "attributes": {
                    "name": "Nstor Abad Sanjun",
                    "team": {
                        "id": 2,
                        "name": "Spain"
                    },
                    "age": 23,
                    "sport": "Gymnastics",
                    "total_medals_won": 0
                }
            },
            {
                "id": "3",
                "type": "olympian",
                "attributes": {
                    "name": "Antonio Abadia Beci",
                    "team": {
                        "id": 2,
                        "name": "Spain"
                    },
                    "age": 26,
                    "sport": "Athletics",
                    "total_medals_won": 0
                }
            },...etc...
```
#### GET
```/api/v1/olympian?age=youngest```
##### Example Response
```
{
    "data": {
        "id": "2248",
        "type": "olympian",
        "attributes": {
            "name": "Ana Iulia Dascl",
            "team": {
                "id": 1,
                "name": "Romania"
            },
            "age": 13,
            "sport": "Swimming",
            "total_medals_won": 0
        }
    }
}
```
#### GET
```/api/v1/olympian?age=oldest```
##### Example Response
```
{
    "data": {
        "id": "1357",
        "type": "olympian",
        "attributes": {
            "name": "Julie Brougham",
            "team": {
                "id": 52,
                "name": "New Zealand"
            },
            "age": 62,
            "sport": "Equestrianism",
            "total_medals_won": 0
        }
    }
}
```
#### GET
```/api/v1/olympian_stats```
##### Example Response
```
{
    "olympian_stats": {
        "data": {
            "id": null,
            "type": "olympian_stats",
            "attributes": {
                "total_competing_olympians": 2928,
                "average_weight": {
                    "unit": "kg",
                    "male_olympians": 77.94,
                    "female_olympians": 61.38
                },
                "average_age": 26.42
            }
        }
    }
}
```
#### GET
```/api/v1/events```
##### Example Response
```
{
                    "sport": "Rowing",
                    "events": [
                        "Rowing Men's Coxless Pairs",
                        "Rowing Women's Lightweight Double Sculls",
                        "Rowing Women's Quadruple Sculls",
                        "Rowing Men's Coxless Fours",
                        "Rowing Women's Double Sculls",
                        "Rowing Men's Quadruple Sculls",
                        "Rowing Men's Coxed Eights",
                        "Rowing Women's Single Sculls",
                        "Rowing Men's Single Sculls",
                        "Rowing Women's Coxed Eights",
                        "Rowing Men's Lightweight Coxless Fours",
                        "Rowing Men's Double Sculls",
                        "Rowing Women's Coxless Pairs",
                        "Rowing Men's Lightweight Double Sculls"
                    ]
                },
                {
                    "sport": "Taekwondo",
                    "events": [
                        "Taekwondo Women's Flyweight",
                        "Taekwondo Men's Featherweight",
                        "Taekwondo Men's Heavyweight",
                        "Taekwondo Women's Featherweight",
                        "Taekwondo Women's Heavyweight",
                        "Taekwondo Men's Flyweight",
                        "Taekwondo Women's Welterweight",
                        "Taekwondo Men's Welterweight"
                    ]
                },
                {
                    "sport": "Handball",
                    "events": [
                        "Handball Men's Handball",
                        "Handball Women's Handball"
                    ]
                },
                {
                    "sport": "Boxing",
                    "events": [
                        "Boxing Men's Middleweight",
                        "Boxing Men's Lightweight",
                        "Boxing Men's Heavyweight",
                        "Boxing Men's Flyweight",
                        "Boxing Women's Flyweight",
                        "Boxing Men's Light-Heavyweight",
                        "Boxing Men's Super-Heavyweight",
                        "Boxing Men's Bantamweight",
                        "Boxing Men's Light-Welterweight",
                        "Boxing Women's Lightweight",
                        "Boxing Men's Welterweight",
                        "Boxing Men's Light-Flyweight",
                        "Boxing Women's Middleweight"
                    ]
                },
```
#### GET
```/api/v1/events/91/medalists```
##### Example Response
```
{
    "data": {
        "id": "91",
        "type": "event_medalist",
        "attributes": {
            "event": "Badminton Mixed Doubles",
            "medalists": [
                {
                    "name": "Tontowi Ahmad",
                    "team": "Indonesia-1",
                    "age": 29,
                    "medal": "Gold"
                },
                {
                    "name": "Chan Peng Soon",
                    "team": "Malaysia",
                    "age": 28,
                    "medal": "Silver"
                }
            ]
        }
    }
}
```

## Schema

![Database Schema](/Schema_final.png)

## Tech Stack
- Ruby 2.6.3p62
- Rails 5.2.3
- PostgreSQL 11.5
- RSpec 3.8
- Travis CI 1.8.10
