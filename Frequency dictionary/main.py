import nltk
import string
import pymorphy2
from nltk.corpus import stopwords
from nltk.stem.snowball import RussianStemmer


def printDic(dictionary, number):
    result = []
    for elem in dictionary.items():
        result.append((-elem[1], elem[0]))
    f = open('frequency{0}.txt'.format(number), 'w', encoding="utf8")
    for word in sorted(result):
        print(word[1], -word[0] + 1)
        f.write(word[1] + ' ' + str(-word[0]) + '\n')


def method1(tokens):
    print("The way 1")
    dictionary = dict()
    morph = pymorphy2.MorphAnalyzer()
    for word in tokens:
        p = morph.parse(word)[0]
        dictionary[p.normal_form] = dictionary.get(p.normal_form, 0) + 1
    printDic(dictionary, 1)



def method2(tokens):
    print("The way 2")
    stemmer = RussianStemmer(False)
    dictionary = dict()
    for word in tokens:
        normal_form = stemmer.stem(word)
        dictionary[normal_form] = dictionary.get(normal_form, 0) + 1
    printDic(dictionary, 2)


f = open('text.txt', 'r', encoding="utf8")
text = f.read()
tokens = nltk.word_tokenize(text)

tokens = [i for i in tokens if (i not in string.punctuation)]
stop_words = stopwords.words('russian')
stop_words.extend(['что', 'это', 'так', 'вот', 'быть', 'как', 'в', '—', 'к', 'на', "«", "»", "б", "..", "у", "о",
                   "ль", "уж", "не", "и", "...", "по"])
tokens = [i for i in tokens if (i not in stop_words)]

method1(tokens)
print()
method2(tokens)

