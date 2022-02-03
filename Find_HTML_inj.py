import requests
import re

url_lst = []

def readFile(filename):
    with open(filename, 'r') as file:
        urls = file.readlines()
        for x in urls:
            url_lst.append(x[:-1])
        file.close()
    print(len(url_lst))
        # print(urls)




def findWord(url, word):
    page = requests.get(url).text
    findword  = re.findall(word, page)
    num = page.find(word)
    print(findword)
    print(num)


def count_words(url, the_word):
    try:
        r = requests.get(url).text
        output = r.count(the_word)
        print(f"{url}: {output}")
        return output
    except Exception as e:
        return e

if __name__ == '__main__':
    readFile("host.txt")
    new_lst = []
    for url in url_lst:
        get_response = count_words(url, 'frostb1te">bugbounty')
        try:
            if int(get_response) > 1:
                new_lst.append(url)
                # print(f"{url}: {get_response}")
        except Exception as e:
            print(e)

    print(f"New Urls are: {new_lst}")

    with open("output.txt", 'a') as file:
        for url in new_lst:
            file.write(url+'\n')
        file.close()


