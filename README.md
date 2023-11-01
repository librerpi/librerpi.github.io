librerpi website
================

How can I submit documentation?
-------------------------------

Your page **must** be written in markdown, it should be put in the docs/ 
directory.

Please note that 'learn' (the documentation generator used) uses the first 
line of the file as the title. We usually put the title in h1, like this:

    Title
    =====

    Section
    -------
    Text

After you wrote documentation, it's recommended to generate the website 
at least once, and check if it renders correctly:

    $ ./learn.sh
    $ # Then point your browser to ./www/

When you're done you can send a Pull Request.
