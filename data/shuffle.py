import random
import os


def shuffle(filename: str):
    with open(filename, "r", encoding='utf-8') as fid:
        li = fid.readlines()
        fid.close()
        print(li)

        random.shuffle(li)
        print(li)

        with open("shuffled_" + filename, "w", encoding='utf-8') as fid2:
            fid2.writelines(li)


def main():
    shuffle("all_addresses.csv")


if __name__ == '__main__':
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    print(BASE_DIR)
    main()
