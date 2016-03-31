## Exercises: Course 101, Lesson 3, Easy 2
(Re-working exercises as review for assessment 109)
#### Q 1
In this hash of people and their age,

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
````

see if there is an age present for "Spot".

Bonus: What are two other hash methods that would work just as well for this solution?

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")
ages["Spot"]
ages.values_at("Spot")

````
----

#### Q 2
Add up all of the ages from our current Munster family hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
````

#### Answer
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.inject { |sum, age| sum + age }

````
---
#### Q 3
In the age hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
````

throw out the really old people (age 100 or older).

#### Answer
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |name, age| age < 100 }
````
---

#### Q 4
Starting with this string:
````ruby
munsters_description = "The Munsters are creepy in a good way."
````

Convert the string in the following ways (code will be executed on original munsters_description above):

````ruby
"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
````

#### Answer
````ruby
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!

````
---

#### Q 5
We have most of the Munster family in our age hash:
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
````

add ages for Marilyn and Spot to the existing hash
````ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
````

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
ages["Marilyn"] = 22
ages["Spot"] = 237

````
---

#### Q 6
Pick out the minimum age from our current Munster family hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
````

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.min # returns key & value for minimum in hash
ages.values.min # returns minimum value in hash

````

#### Q 7
See if the name "Dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### Answer
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino")
```


#### Q 8
In the array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"


#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.find_index { |name| name.start_with?('Be')}

```
#### Q 9
Using array#map!, shorten each of these names to just 3 characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```


#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3)}
```
#### Q 10

Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3)}
```