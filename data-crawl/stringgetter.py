import requests

headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36'}


def getPageString(url):
  data = requests.get(url, headers=headers)
  print(data.content)
  return data.content
