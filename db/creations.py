# coding:utf-8

import pymongo
import operator
import math
import datetime

from pymongo import MongoClient
from .config import *

client = MongoClient()
db = client[db_name]

def get_creations():
    creations = []

    for creation in db.creations.find():
        creations.append(creation)

    return creations
