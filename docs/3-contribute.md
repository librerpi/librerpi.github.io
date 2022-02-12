Contributions
=============

So you want to contribute to librerpi? Great!

## librerpi repos

Here are the librerpi repos:

- The current codebase is located 
[here](http://github.com/librerpi/lk-overlay) ;

- The *old* codebase (which is a fork of 
christinaa's work) is located 
[here](http://github.com/librerpi/rpi-open-firmware) ;

- The website repo is located 
[here](http://github.com/librerpi/librerpi.github.io).

## Commits

Commit descriptions should describe what you've done, 
commit messages such as "update file" or "add smth" 
aren't good commit messages.

These are of course recommendations and aren't actually 
required.

## Website

The website uses [learn](http://vitali64.duckdns.org?p=utils/learn.git)
, here's how it works:

- Markdown files are put in `docs/` ;

- The first line in the markdown file is used as a title ;

- Every `git push` triggers the CI/CD which generates the website 
you're reading.

Every page is written in markdown and then compiled into html.

