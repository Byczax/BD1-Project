import csv

import numpy as np


def file_to_data(filename):
    print("test")
    with open("people_5000.csv", mode="w", encoding='utf-8') as f:
        with open('people.txt', mode='r', encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 1
            for row in csv_reader:
                f.write(str(line_count) + "," + row[1] + "," + row[2]+"\n")
                print(str(line_count) + "," + row[1] + "," + row[2])
                line_count += 1


def main():
    file_to_data("./people.txt")


if __name__ == '__main__':
    # main()
    file_to_data("people.txt")
