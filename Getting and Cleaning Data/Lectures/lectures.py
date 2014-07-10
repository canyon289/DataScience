import urllib

pdfs = []
with open('lectures.htm', 'r') as file:
    for line in file:
        if ".pdf" in line:
            pdfs.append(line[line.index("http"):-1])

print(pdfs)

for url in pdfs:
    index = -url[::-1].index("/")
    file = urllib.request.Request(url,headers={'User-Agent' : "Magic Browser"})
    with open(url[index:-2], 'w') as localfile:
        localfile.write(file.data())
    
    
print("download finished")