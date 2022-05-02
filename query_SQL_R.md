## Querying SQL database in R

You first need to create a ~/.Renviron file and include the following (removing the <>)

```
userid = "<username>"
psd = "<password>"
```

Then you can use the commands below to query your SQL database

```R
install.packages(c("DBI", "RMySQL"))

library(DBI)

## Connect using con
con <- dbConnect(RMySQL::MySQL(),
                dbname = "<databasename>",
                host = "<servername>",
                port = 3306,
                user = Sys.getenv("userid"),
                password = Sys.getenv("pwd")
            )

tables <- dbListTables(con)
str(tables)

data <- dbReadTable(con, "<tablename>")
```

More information and further examples can be found at [R-bloggers](https://www.r-bloggers.com/2020/09/how-to-connect-r-with-sql/)
