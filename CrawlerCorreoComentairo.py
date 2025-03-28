import requests
from bs4 import BeautifulSoup
from bs4 import Comment
import re

def comentario(text):
    return isinstance(text, Comment)

url = "http://127.0.0.1:8000/victima.html"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")
comentarios = soup.find_all(string=comentario)
p_correo=r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
correos = re.findall(p_correo,soup.get_text())
print(comentarios)
print(correos)
