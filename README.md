# WORKOUT LOG APP   
### A Simple app to log your wokouts, track daily progress by charts, and share it with friends and family.   

### Heroku Link: http://workout-logs-app.herokuapp.com/   

Log your workouts and see your past week's performace graphically. Share your workouts
with your friends and follow them to track their workouts. Create new workouts, edit them
as per your needs.   

### Gems/third party libraries for the app:   
1. [RSpec](http://rspec.info/) & [Capybara](https://github.com/jnicklas/capybara): The App was developed according to BDD principles. This was my first attemp to do so.  
2. [Guard-Rspec](https://github.com/guard/guard-rspec): For automated testing, one of the coolest gem
2. [Devise](https://github.com/plataformatec/devise) gem: For signing users up. Devise was also customized to add "first name" and "last name"   
3. [Bootstrap-sass](https://github.com/twbs/bootstrap-sass) was used to style the app.  
4. [JQuery-UI Rails](https://github.com/joliss/jquery-ui-rails) was used for date picker while creating and editing workouts.
5. [Morris.js](https://github.com/morrisjs/morris.js), a third party js and css library was used to show the exercises by charts.  
6. [Turbolinks](https://github.com/turbolinks/turbolinks-classic), `page:load` event for faster loading of pages.  
7. [will_paginate-bootstrap](https://github.com/bootstrap-ruby/will_paginate-bootstrap) gem: For pagination and styling 

### App Features:  
1. CRUD Users: Users signup to create their workout log.  
2. CRUD Exercises  
3. Track past week's exercises  
4. Search Friends  
5. Follow/unfollow them to track their exercises  
6. Intuitive Workout tracking by line graph.

