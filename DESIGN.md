## Design Notes

- This SDK is a basic Ruby gem that wraps API calls to the The One API to Rule Them All API
- Much of the code is auto-generated boilerplate gem code, except for `lib` and `spec`
- I decided to take an object oriented approach, using static methods to access the API but storing the results in an object with accessors
- I considered supporting pagination, however I noticed that none of the response lists contained more than 1010 results, so I opted to return all the results for all lists. Not only was this easier to accomplish but it will be easier for the end user to consume.
- Configuration is setup using the standard Rails Initializer pattern
- RSpec tests use Webmock to mock the actual API requests
