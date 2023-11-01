Contributions
=============

librerpi repos
--------------

Repos:

* The current codebase is located 
  [here](http://github.com/librerpi/lk-overlay)
* The *old* codebase (which is a fork of 
  christinaa's work) is located 
  [here](http://github.com/librerpi/rpi-open-firmware)
* The website repo is located 
  [here](http://github.com/librerpi/librerpi.github.io).

Commits
-------

Commit descriptions should describe what you've done, 
commit messages such as "update file" or "add smth" 
aren't good commit messages.

These are of course recommendations and aren't actually 
required.

Website
-------

The website uses a modified fork of [learn](https://git.vitali64.duckdns.org/utils/learn.git).

Pages are written in [Markdown](https://en.wikipedia.org/wiki/Markdown), and 
the website builder uses the first line of a file as the title:

    Title
    =====

    Text...

The title of the page will be `Title`.

Once you're done writing, you can put your files in `docs/` in the website 
repository. Please don't put capital letters in names.

After that, you may want to see how well it renders. Run:

    $ ./learn.sh clear
    $ ./learn.sh

And point your web browser to `path/to/librerpi/website/repository/www/`.

Once you're done, you can send patches to the GitHub page.
