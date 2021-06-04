## Parallel Download

Write an elixir program that takes a list of URLs and makes GET requests to them in parallel. Print out the time taken to complete each request and its resulting HTTP code.
Be sure to handle cases when some URLs are invalid or when the server doesn‚Äôt respond. e.g:

  ```sh 
$ make run
  ./parallel_download.exs google.com http://www.bing.com inactive-domain.blah htpp://not-a-web-url
```
```sh
GET google.com -> 29ms 301
GET http://www.bing.com -> 45ms 200
GET inactive-domain.blah -> 500ms nxdomain
IGNORED htpp://not-a-web-url
```

### Some guidelines:

- Add a README file with a high level description of the system design
- Try to document your decisions, including any libraries used.
- We would like to see tests in your submission. We think they're useful for both guiding and documenting your development process.
- The project should be run from a single bash script or a Makefile:‚`./run.sh`‚`./test.sh`‚`make run`‚`make test`.
- It's ok to submit an incomplete challenge. Tell us why you were stuck and what paths you tried. We often learn a lot from our own mistakes.
- The task description is short and provides a basic description of what‚Äôs expected. If you feel like something is ambiguous or there are multiple ways to accomplish the goal, you are encouraged to make assumptions that will facilitate an easier solution. Please just make sure to note what assumptions you made.
- Please DO NOT upload your solution to a public repository on Github, Gitlab or Bitbucket.

