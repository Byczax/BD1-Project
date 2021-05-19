import random
import time
import string


def random_string_generator(str_size: int, allowed_chars):
    return ''.join(random.choice(allowed_chars) for _ in range(str_size))


def str_time_prop(start, end, time_format, prop):
    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))
    ptime = stime + prop * (etime - stime)
    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%m/%d/%Y %I:%M %p', prop)


def main():
    print("yo, random date, password")
    print(random_date("1/1/2008 1:30 PM", "1/1/2009 4:50 AM", random.random()))
    chars_password = string.ascii_letters + string.punctuation
    chars_login = string.ascii_letters
    size = random.randint(5, 10)
    print('Random password of length', size, '  =',
          random_string_generator(size, chars_password))
    size = random.randint(10, 15)
    print('Random login of length', size, '  =',
          random_string_generator(size, chars_login))
    
    create_data("client_address","city, street_addres, postal_code, description")
    
    


def create_data(table_name, params, params_values):
    table_string = "insert into {table_name}(" + params + ") values(" + params_values + ");\n"
    print("something")

if __name__ == '__main__':
    main()
