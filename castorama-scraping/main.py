from bs4 import BeautifulSoup
import requests

categories_urls = ['https://www.castorama.pl/produkty/instalacja.html','https://www.castorama.pl/produkty/budowa.html','https://www.castorama.pl/produkty/wykonczenie.html','https://www.castorama.pl/produkty/urzadzanie.html','https://www.castorama.pl/produkty/ogrod.html','https://www.castorama.pl/produkty/narzedzia-i-artykuly.html']

for category in categories_urls:
    response = requests.get(category)
    html_soup = BeautifulSoup(response.text, 'html.parser')
    single_categories = html_soup.find_all('a', class_ ="custom-menu-item")
    for single_category in single_categories:
        response = requests.get('https://www.castorama.pl'+single_category['href'])
        html_soup = BeautifulSoup(response.text, 'html.parser')
        products_names = html_soup.find_all('a', class_ ="name-product-tail__link link-base")
        file = open('products.csv','a',encoding='utf8')
        for name in products_names:
            print(name['title'])
            file.write(name['title']+'\n')
        file.close()
