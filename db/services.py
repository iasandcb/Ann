# coding:utf-8

import pymongo
import operator
import math
import datetime

from pymongo import MongoClient
from .config import *

client = MongoClient()
db = client[db_name]

def get_services():
    services = []

    for service in db.services.find():
        services.append(service)

    return services
