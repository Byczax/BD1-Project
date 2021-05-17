import json
import random

import geojson
import csv
import re
import pandas as pd


def read_json(path_to_file):
    with open("all_addresses.csv", mode="w", encoding='utf-8') as f:
        with open(path_to_file, encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 1
            for row in csv_reader:
                # needed_data = (str(line_count) + "," +
                #                str(re.findall(r'"(.*?)"', row[3])[0]) + "," +
                #                str(re.findall(r'"(.*?)"', row[2])[0]) + "," +
                #                str(re.findall(r'"(.*?)"', row[8])[0]) + "," +
                #                str(re.findall(r'"(.*?)"', row[5])[0]))
                # f.write(needed_data+"\n")
                number = re.findall(r'"(.*?)"', row[3])
                street = re.findall(r'"(.*?)"', row[2])
                postal_code = re.findall(r'"(.*?)"', row[8])
                city = re.findall(r'"(.*?)"', row[5])
                if number and street and postal_code and city:
                    # print(
                    #     str(line_count) + "," +
                    #     str(number[0]) + "," +
                    #     str(street[0]) + "," +
                    #     str(postal_code[0]) + "," +
                    #     str(city[0]) + "\n")
                    f.write(
                        str(line_count) + "," +
                        str(number[0]) + "," +
                        str(street[0]) + "," +
                        str(postal_code[0]) + "," +
                        str(city[0]) + "\n")
                # print(str(line_count) + "," +
                #       str(re.findall(r'"(.*?)"', row[3])[0]) + "," +
                #       str(re.findall(r'"(.*?)"', row[2])[0]) + "," +
                #       str(re.findall(r'"(.*?)"', row[8])[0]) + "," +
                #       str(re.findall(r'"(.*?)"', row[5])[0]))
                line_count += 1
                # if line_count > 50000:
                #     break


# def read_json(filename: str):
#     with open(filename, encoding='utf-8') as file:
#         data = json.load(file)
#
#         return data


if __name__ == "__main__":
    main_data = read_json("locations.json")
    print(main_data)
    # for feature in main_data['features']:
    #     print(feature['properties'])
