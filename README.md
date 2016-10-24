# diff_app

RESTful application for comparing JSON encoded binary data.

This application has one endpoint responsible for storing the left content to be compared (POST)
```
<host>/v1/diff/<ID>/left
```

One endpoint responsible for storing the right content to be compared (POST)
```
<host>/v1/diff/<ID>/right
```

And one endpoint to retrieve the diff results (GET)
```
<host>/v1/diff/<ID>
```


---
# System preparation

### Install dependencies
> bundle install

### Create database structure
> rake db:migrate


---
# Run the test suite

The following command will run all the tests written for this application. The unit tests are placed in the test/models/v1 directory. The integration tests are placed in the test/controllers/v1 directory.
> rake test


---
# Run the application

> rails server


---
# Usage

After starting the rails server, you are able to make requests to the diff_app API. In the root directory of this application, there are two JSON base64 encoded binary data files (left.json and right.json) that can be used as sample for the following tests:

### Posting left content to be compared
> curl -X POST --data-binary "@left.json" http://localhost:3000/v1/diff/1/left

### Posting right content to be compared
> curl -X POST --data-binary "@right.json" http://localhost:3000/v1/diff/1/right

### Retrieving diff results
> curl -X GET http://localhost:3000/v1/diff/1

Example of possible returns while retrieving diff results:
```
{"diff_result":"Left and Right were not provided yet"}
{"diff_result":"Left and Right are equal"}
{"diff_result":"Left and Right have different sizes"}
{"diff_result":[{"offset":3,"length":2},{"offset":9,"length":1}]}
```

Note: when a post request is made to the "left" or "right" endpoints, if id sent in URL does not represent any of the records stored in database, it will be created automatically. Also, if the same endpoint ("left" or "right") is called more than once, it keeps being updated.


---
# Suggestions for improvement
- Make the diff results more elegant
- Improve the README summary
