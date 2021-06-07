# Decomp
We need two endpoints:
- `/states` -> which will be an INDEX action, and
should return an array of _all_ the states with their accompanying data
- `/states/:STATE_ABBREVIATION` (e.g. `states/FL`) -> which will be a SHOW action, and
should return the data just for that state

Question:
How do we pass info from the 'abbreviations' table to the 'states_data' table?

What *should* happen:
-1. the user sees a map of the country with clickable icons, pins etc for each state AND a ?country-wide? comparison chart ... might be a good chance to display all factors in a multi-category bar chart (different colors for each state)
1. a user sends a 'GET' request with an endpoint that includes the state abbreviation (likely, using js and html/css to convert input-click into request)
2. the api receives the '/states/[abbreviation]'
3. the 'state' controller looks up what *state* that abbreviation is assosiated with (?using k:v pairs?) in the 'abbreviations' table
4. the 'state' controller uses the returned *state* to then fetch all assosiated data in the 'states_data' table
5. the 'state' controller sends that data back as js to the FE
6. the FE displays said data in a pretty way

Precursory Questions:
1. Can endpoints contain ":ids" that arent numbers? Can they be "state abbreviations"? 
2. If so, how does the routes file handle them? How is that info passed? Do I need to learn more about "params"?
- Do we need to review that class lesson on QUERY endpoints ?