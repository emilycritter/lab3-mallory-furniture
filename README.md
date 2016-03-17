# Ruby on Rails Basics
## Week 3 Lab - Mallory Furniture
##### Due Monday, February 22, 2016

Mallory Furniture is a local vintage furniture retailer with a constantly changing selection. Their showroom has limited floor space so they initially built a website to show all their inventory, including those in the warehouse.
They decided not to go the e-commerce route since they only need static pages to show what product they currently have. Regardless, they've found maintaining the site to be to be a pain in the ass since they can't easily synchronize the items on the page with the continuously changing items in stock.

They've kept good records in an Excel spreadsheet and they are wondering if there is an easier way to keep their website up to date as their inventory changes.

## Objectives
### Learning Objectives
After completing this assignment you should understand:

* How dynamic webpages work on the web
* How URL's determine the initial behavior of your application.
* Understand the concept of Model-View-Controller (MVC) architecture.
* The rails asset pipeline for including stylesheets and image assets in your Rais app.


### Performance Objectives
After completing this assignment you should be able to

* Create a Rails app.
* Use the Router to have a dynamic set of pages.
* Use the Controller to import data, manipulate data, and pass it to the View to render.
* Write ruby code inside the View (the `«view_name».html.erb` template) to display data dynamically.
* Integrate static assets like images, and `.css` stylesheets into your app for output/presentation.

## Requirements
**Make a Rails app that generates static pages of Mallory Furniture's current inventory based on data imported from a `.csv` file.** _*Match styles to the provided screenshots *_

### Normal Mode
There should be 3 types of pages: the home page, a page that shows multiple-products, and a single-product page. Your Rails app should handle the routing, controller logic, and view rendering based on how the user navigates the site.

In the controller, some data manipulation is required.
![alt text](http://i.imgur.com/WbNrZty.jpg)
![alt text](http://i.imgur.com/okoKknI.jpg)
![alt text](http://i.imgur.com/7Uoyhoa.png)

home multi-listing single
1. Create a Product class with attributed matching the CSV file.
2. Create a method that identifies items on clearance and adjusts the price.
  * Apply a 10% discount on the price for items that are in 'good' condition
  * Apply a 20% discount on the price for items that are in 'average' condition.
  * For each clearance item on the page, make sure that the site indicates that the item is on clearance (next to the price, for instance).
3. Do not show items on the site that have a quantity of 0.

### Difficult Mode
* Organize the items by furniture category on the multiple-products page.
* On the home page, show the furniture-categories as options that the user can select. When they navigate from the home-page to the multiple-products page after selecting an option, they will only see items of the category they selected.
  * _e.g. if they select 'tables' then they will only see the items that are in the 'tables' category_

### Epic mode.
Instead of using a warehouse, Mallory Furniture is expanding their display area by putting their inventory into 3 retail locations: North, South, and West.

Items with PID's between 100-199 will go to the North location, items with PID's 200-299 will go to the South location and items with PID's 300 and up will go to the West location.

1. Identify the location of each item and create a route and view for each location.
2. On the single-listing page, show same-category items that are at the same location.
  * _e.g. "additional {category} at this location: {item1} {item2} {item3}"._

## Resources
* Images, CSV file, and background image, Screenshots: [https://www.dropbox.com/sh/zsqwxh22g6zhjsp/AAB_dnT9Keof083nFpxDTbJ_a?dl=0](https://www.dropbox.com/sh/zsqwxh22g6zhjsp/AAB_dnT9Keof083nFpxDTbJ_a?dl=0)
* [Video Prep](https://vimeo.com/139012189)
