#!/usr/bin/env bash
# The file python3.inv contains the database of Sphinx hyperlink targets used by
# the intersphinx extension. See
#
#    http://sphinx-doc.org/ext/intersphinx.html
#
# To be able to compile Sage without accessing the net, we use a local copy of
# this database. Here is how to update it by downloading the file
# for the latest stable Python version:

if command -v wget > /dev/null 2>&1 ; then
    rm -f python.inv python2.inv python3.inv
    wget https://docs.python.org/3/objects.inv -O - > python3.inv
elif command -v curl > /dev/null 2>&1 ; then
    # On OS X, curl is installed by default, but not wget.
    rm -f python.inv python2.inv python3.inv
    curl https://docs.python.org/3/objects.inv > python3.inv
else
    echo "Error: neither wget nor curl is installed."
    return 1
fi
