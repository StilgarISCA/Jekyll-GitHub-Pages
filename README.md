# Jekyll-GitHub-Pages
Dockerfile to run (test) my Jekyll GitHub pages locally (macOS)

## About
I've had a lot of problems keeping Jekyll running locally on my Mac. Ruby gets stale, or there are weird version requeirements, packages and dependancies change and so forth. Having been fed up with this, I also tried using other people's pre-built Docker images from Docker Hub, but I ran into the same types of issues. Other people change their containers and it would break my ability to just sit down and do work. This is my Dockerfile for building up my own image to work with _my_ GitHub Jekyll pages locally. It might not work for you, but maybe it will.

## How to run

### Build the container
`docker build -t name-for-your-image .`

Where . is the path to the Dockerfile

### Launch the container
`docker run -it -v /path/to/local/github:/./pathToLinuxMount -p 4000:4000 --rm name-for-your-image bash`

This will start the container at the bash prompt. The path after the `-v` switch should be to your local GitHub pages repository that you want to build/run.

### Run your site
From the container's prompt:

* `cd ./pathToLinuxMount`
* `bundle update`
* `bundle exec jekyll serve --drafts --incremental --baseurl ‘' -H 0.0.0.0`

From your host OS, launch your browser and visit http://localhost:4000

## Gotchas
There are some gotchas I've run into with this, but most of them involve setting the proper configurations in your _config.yml. Having the correct exclusions is key. I'm not even certain this is everything that should be excluded, but it helps get the job done for me. YMMV.

`exclude: ['vendor', 'node_modules', 'src', 'Gemfile', 'Gemfile.lock']`