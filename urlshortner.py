import redis

URL_DB = "URL_DB"


ALPHABET = "abcdefghiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

def convert_counter(counter):
    digit = counter / len(ALPHABET)
    result = ""
    while (digit > 0):
        result




for i in range(0, 100):
    print i, convert_counter(i)



class DB(object):

    def __init__(self):
        r = redis.StrictRedis(host='localhost', port=6379, db=URL_DB)


    def store_url():
        self.r.set('foo', 'bar')
        print self.r.get('foo')


