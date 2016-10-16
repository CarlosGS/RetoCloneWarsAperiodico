#!/usr/bin/python
# -*- coding: utf-8 -*-

# La lista de palabras mas frecuentes se ha obtenido descargando una copia de la bandeja de correo de google (https://takeout.google.com/settings/takeout), solamente para los mensajes con la etiqueta "Clon Wars"
# Una vez tenemos el fichero "Clon Wars.mbox", se puede leer desde este script

import mailbox, string
from email.header import decode_header

mymail = mailbox.mbox('Clon Wars.mbox')


uniqueWords = {}

not_letters_or_digits = u'!"#%\'()*+,-./:;<=>¿?@[\]^_`{|}~'
translate_to=u' '
translate_table = dict((ord(char), translate_to) for char in not_letters_or_digits)

def translate_non_alphanumerics(to_translate):
    return to_translate.translate(translate_table)

print(len(mymail))
i = 0
for message in mymail:
    asunto = message['subject']
    #print(asunto)
    try:
        if asunto[0] == '=':
            bytes, encoding = decode_header(asunto)[0]
            asunto = bytes.decode(encoding)
        asunto = asunto.encode('utf-8')
        asunto = asunto.decode('utf-8').lower()
        asunto = translate_non_alphanumerics(asunto)
    except:
        print(asunto)
        if asunto[0] == '=':
            bytes, encoding = decode_header(asunto)[0]
            asunto = bytes.decode(encoding)
        print(asunto)
        asunto = asunto.encode('utf-8')
        print(asunto)
        asunto = asunto.decode('utf-8').lower()
        print(asunto)
        asunto = translate_non_alphanumerics(asunto)
        print(asunto)
        print("")
        continue
    
    for palabra in asunto.split():
        if palabra in uniqueWords:
            uniqueWords[palabra] += 1
        else:
            uniqueWords[palabra] = 1
    if i%1000 == 0: print(i)
    i+=1

todas = sorted(uniqueWords, key=uniqueWords.__getitem__)
todas.reverse()

listaCloneWars = {}
i = 0
j = 0
#for palabra in todas[:1000]:
while i < 500:
    palabra = todas[j]
    if len(palabra) > 1:# and len(palabra) < 8:
        listaCloneWars[palabra] = len(palabra)
        print(palabra)
        i += 1
    j += 1

print(listaCloneWars)
pals = sorted(listaCloneWars, key=listaCloneWars.__getitem__)
for pal in pals:
    print(pal)

