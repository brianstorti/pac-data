#pac-data (wip)

###What?
These are all the data that we could get from the government (http://repositorio.dados.gov.br/governo-politica/administracao-publica/pac/)[open data] website.

###Why?
We are creating this repository because we are building (pac-info)[http://github.com/brianstorti/pac-info],
an application that will create a nice visualization for this messy data. Getting this data was not that easy,
there is a lot of files in the website, they are not properly formatted and importing these data to a database
may not be so trivial. Making this available in an easier way encourages other people to build cool stuff.
Coding is fun, searching and formatting csv files is not.

###how to use it?
There is an `import-to-mongodb.sh` file that will read these `.csv` files and import them into your mongodb database.
Make sure `mongod` is up and running before executing this script.

###Who?
* Brian Thomas Storti
* Carlos Chiconato
* Thiago Felix
