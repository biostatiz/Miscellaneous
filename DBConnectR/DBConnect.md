Untitled
================

### Establish a connection

``` r
# Load the DBI package
library(DBI)

# Connect to the MySQL database: con
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "tweater", 
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                 port = 3306,
                 user = "student",
                 password = "datacamp")

# Build a vector of table names: tables
tables <- dbListTables(con)

# Display structure of tables
str(tables)
```

    ##  chr [1:3] "comments" "tweats" "users"

``` r
# Import the users table from tweater: users
users <- dbReadTable(con, "users")
users
```

    ##   id      name     login
    ## 1  1 elisabeth  elismith
    ## 2  2      mike     mikey
    ## 3  3      thea   teatime
    ## 4  4    thomas tomatotom
    ## 5  5    oliver olivander
    ## 6  6      kate  katebenn
    ## 7  7    anjali    lianja

``` r
# Get table names
table_names <- dbListTables(con)

# Import all tables
tables <- lapply(table_names, dbReadTable, conn = con)
tables
```

    ## [[1]]
    ##      id tweat_id user_id            message
    ## 1  1022       87       7              nice!
    ## 2  1000       77       7             great!
    ## 3  1011       49       5            love it
    ## 4  1012       87       1   awesome! thanks!
    ## 5  1010       88       6              yuck!
    ## 6  1026       77       4      not my thing!
    ## 7  1004       49       1  this is fabulous!
    ## 8  1030       75       6           so easy!
    ## 9  1025       88       2             oh yes
    ## 10 1007       49       3           serious?
    ## 11 1020       77       1 couldn't be better
    ## 12 1014       77       1       saved my day
    ## 
    ## [[2]]
    ##   id user_id
    ## 1 75       3
    ## 2 88       4
    ## 3 77       6
    ## 4 87       5
    ## 5 49       1
    ## 6 24       7
    ##                                                                  post
    ## 1                                       break egg. bake egg. eat egg.
    ## 2                           wash strawberries. add ice. blend. enjoy.
    ## 3                       2 slices of bread. add cheese. grill. heaven.
    ## 4               open and crush avocado. add shrimps. perfect starter.
    ## 5 nachos. add tomato sauce, minced meat and cheese. oven for 10 mins.
    ## 6                              just eat an apple. simply and healthy.
    ##         date
    ## 1 2015-09-05
    ## 2 2015-09-14
    ## 3 2015-09-21
    ## 4 2015-09-22
    ## 5 2015-09-22
    ## 6 2015-09-24
    ## 
    ## [[3]]
    ##   id      name     login
    ## 1  1 elisabeth  elismith
    ## 2  2      mike     mikey
    ## 3  3      thea   teatime
    ## 4  4    thomas tomatotom
    ## 5  5    oliver olivander
    ## 6  6      kate  katebenn
    ## 7  7    anjali    lianja

``` r
# 
```
