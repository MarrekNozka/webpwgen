# Change working directory so relative paths (and template lookup) work again
import os
os.chdir(os.path.dirname(__file__))

print __file__

import bottle
import webpwgen
application = bottle.default_app()
