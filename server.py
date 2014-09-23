import tornado.escape
import tornado.ioloop
import tornado.web
import tornado.httpserver
import os
import pymongo
import operator
import tornado.websocket
import json
import sys
import datetime
from db.services import get_services

dirname = os.path.dirname(__file__)
print('--')
print(dirname)

sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'db'))

print(sys.path)

STATIC_PATH = os.path.join(dirname, 'static')

print(STATIC_PATH)

from stat import *

from datetime import date
from bson import Binary, Code
from bson.json_util import dumps
from json import JSONEncoder
from bson.objectid import ObjectId

class Application(tornado.web.Application):
    def __init__(self):
        handlers = [
            (r"/time", TimeHandler),
            (r"/services", ServicesHandler), # plural 복수 REST 방식
            (r"/services/(.*)", ServiceHandler), # singular 단수
        ]
        settings = {
            "static_path": STATIC_PATH,
            "compress_response": True,
            "debug": True,
            # "static_url_prefix": "/static/",
            "static_handler_class" : IndexDotHTMLAwareStaticFileHandler
        }
        tornado.web.Application.__init__(self, handlers, **settings)

class TimeHandler(tornado.web.RequestHandler):
    # read with query(condition)
    def get(self):
        self.set_header("Content-Type", "application/json")
        self.write(JSONEncoder().encode({'time': datetime.datetime.now()}))

class ServicesHandler(tornado.web.RequestHandler):
    # read with query(condition)
    def get(self):
        self.set_header("Content-Type", "application/json")
        self.write(JSONEncoder().encode(get_services()))

class ServiceHandler(tornado.web.RequestHandler):
    # read with query(condition)
    def get(self, market_id):
        self.set_header("Content-Type", "application/json")

class IndexDotHTMLAwareStaticFileHandler(tornado.web.StaticFileHandler):
    def set_extra_headers(self, path):
        # Disable cache
        self.set_header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')

    def parse_url_path(self, url_path):
        if not url_path or url_path.endswith('/'):
            url_path += 'index.html'

        return super(IndexDotHTMLAwareStaticFileHandler, self).parse_url_path(url_path)

class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)
        if isinstance(o, date):
            return o.isoformat()
        return json.JSONEncoder.default(self, o)

def main():
    applicaton = Application()
    http_server = tornado.httpserver.HTTPServer(applicaton)
    http_server.listen(9999)

    ioloop = tornado.ioloop.IOLoop.instance()

    ioloop.start()

if __name__ == "__main__":
    main()
