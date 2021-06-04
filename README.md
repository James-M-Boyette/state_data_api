# State Data API

This project was assigned as a 'take-home' project. The goal was to create a web API that returned data about the fifty US states. In particular, the data revolved around the following:

- Median household income (2016)
- Percentage of unemployed population (2016)
- Percentage of population that lives in metro areas (2015)
- Percentage of adults 25 and older with high-school degree (2019)

The API now returns this data for each of the US states. In addition, it provides the full state name (e.g. `"Florida"`) as well as the state's abbreviation (e.g. `"FL"`).

## The Data

I was provided two CSV files. The `state_data.csv` file contained the primary data, and the `abbreviations.csv` file contained the abbreviations for each state.

I was offered the option to move the data from the CSV files into a database, but was required to show the script I used to do so. I accomplished this by 1) moving the .csv's to folder within the app, and 2) ran logic from the seeds file.

Note: up to this point, I was unable to determine why the first column of the .csv's was not returning data when I used k:v pairs. So, I instead stored the column data in a seperate variable, and itterated through it as the .each loop ran.

## The API

The API returns results in JSON. The following endpoints are available:

- `/states` -> should return an array of _all_ the states with their accompanying data
- `/states/:STATE_ABBREVIATION` (e.g. `states/FL`) -> should return the data just for that state

## Bonus: A Front-End

I was given the bonus objective of creating an front-end interactive map that displays the data from the API. One possible tool suggested for this was [DataMaps](http://datamaps.github.io/), as well as libraries in [this article](https://www.hongkiat.com/blog/javascript-libraries-for-interactive-maps/).
