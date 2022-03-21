import logging
import time
import traceback
import urllib.request
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

driver = webdriver.Chrome(service=Service(
  ChromeDriverManager().install()))

pk = 0
error_cnt = 0
items = []

# 물티슈===================================================
for i in range(30):
  driver.get(
    'https://emart.ssg.com/search.ssg?target=all&query=%EB%AC%BC%ED%8B%B0%EC%8A%88')
  time.sleep(3)
  ul = driver.find_element(
    by=By.XPATH, value='/html/body/div[4]/div[4]/div[2]/div[1]/div[6]/div[5]/div[1]/ul')
  lis = ul.find_elements(by=By.TAG_NAME, value='li')
  li = lis[i]

  # init
  item_dict = {}

  # save
  try:
    # get img
    img_url = li.find_element(by=By.CLASS_NAME, value='thmb').find_element(
      by=By.CSS_SELECTOR, value='a > img.i1').get_attribute("src")
    time.sleep(3)
    urllib.request.urlretrieve(img_url, f"images/item{pk}.jpg")
    item_dict['image_url'] = f'images/item{pk}.jpg'
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['title'] = li.find_element(
      by=By.CSS_SELECTOR, value='.title a .tx_ko').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['price'] = li.find_element(
      by=By.CSS_SELECTOR, value='.ssg_price').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['shipping'] = li.find_element(
      by=By.CSS_SELECTOR, value='.tx_deiv').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['rating'] = li.find_element(
      by=By.CSS_SELECTOR, value='.rate_bg').text[3:-1]
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  try:
      # get img_details
    li.find_element(by=By.CSS_SELECTOR, value='.title a').click()
    time.sleep(3)
    driver.switch_to.frame('_ifr_html')
    time.sleep(3)
    img_url = driver.find_element(
      by=By.CSS_SELECTOR, value='body img').get_attribute('src')
    urllib.request.urlretrieve(img_url, f'images/item{pk}_detail.jpg')
    item_dict['image_detail_url'] = f'images/item{pk}_detail.jpg'
    time.sleep(3)

  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  # append
  print(item_dict)
  items.append(item_dict)
  pk += 1

# 신발===================================================
for i in range(30):
  driver.get(
    'https://emart.ssg.com/search.ssg?target=all&query=%EC%8B%A0%EB%B0%9C')
  time.sleep(3)
  ul = driver.find_element(
    by=By.XPATH, value='/html/body/div[4]/div[4]/div[2]/div[1]/div[6]/div[5]/div[1]/ul')
  lis = ul.find_elements(by=By.TAG_NAME, value='li')
  li = lis[i]

  # init
  item_dict = {}

  # save
  try:
    # get img
    img_url = li.find_element(by=By.CLASS_NAME, value='thmb').find_element(
      by=By.CSS_SELECTOR, value='a > img.i1').get_attribute("src")
    time.sleep(3)
    urllib.request.urlretrieve(img_url, f"images/item{pk}.jpg")
    item_dict['image_url'] = f'images/item{pk}.jpg'
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['title'] = li.find_element(
      by=By.CSS_SELECTOR, value='.title a .tx_ko').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['price'] = li.find_element(
      by=By.CSS_SELECTOR, value='.ssg_price').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['shipping'] = li.find_element(
      by=By.CSS_SELECTOR, value='.tx_deiv').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['rating'] = li.find_element(
      by=By.CSS_SELECTOR, value='.rate_bg').text[3:-1]
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  try:
      # get img_details
    li.find_element(by=By.CSS_SELECTOR, value='.title a').click()
    time.sleep(3)
    driver.switch_to.frame('_ifr_html')
    time.sleep(3)
    img_url = driver.find_element(
      by=By.CSS_SELECTOR, value='body img').get_attribute('src')
    urllib.request.urlretrieve(img_url, f'images/item{pk}_detail.jpg')
    item_dict['image_detail_url'] = f'images/item{pk}_detail.jpg'
    time.sleep(3)

  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  # append
  print(item_dict)
  items.append(item_dict)
  pk += 1


# 식초===================================================
for i in range(30):
  driver.get(
    'https://emart.ssg.com/search.ssg?target=all&query=%EC%8B%9D%EC%B4%88')
  time.sleep(3)
  ul = driver.find_element(
    by=By.XPATH, value='/html/body/div[4]/div[4]/div[2]/div[1]/div[6]/div[5]/div[1]/ul')
  lis = ul.find_elements(by=By.TAG_NAME, value='li')
  li = lis[i]

  # init
  item_dict = {}

  # save
  try:
    # get img
    img_url = li.find_element(by=By.CLASS_NAME, value='thmb').find_element(
      by=By.CSS_SELECTOR, value='a > img.i1').get_attribute("src")
    time.sleep(3)
    urllib.request.urlretrieve(img_url, f"images/item{pk}.jpg")
    item_dict['image_url'] = f'images/item{pk}.jpg'
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['title'] = li.find_element(
      by=By.CSS_SELECTOR, value='.title a .tx_ko').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['price'] = li.find_element(
      by=By.CSS_SELECTOR, value='.ssg_price').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['shipping'] = li.find_element(
      by=By.CSS_SELECTOR, value='.tx_deiv').text
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')
  try:
    item_dict['rating'] = li.find_element(
      by=By.CSS_SELECTOR, value='.rate_bg').text[3:-1]
  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  try:
      # get img_details
    li.find_element(by=By.CSS_SELECTOR, value='.title a').click()
    time.sleep(3)
    driver.switch_to.frame('_ifr_html')
    time.sleep(3)
    img_url = driver.find_element(
      by=By.CSS_SELECTOR, value='body img').get_attribute('src')
    urllib.request.urlretrieve(img_url, f'images/item{pk}_detail.jpg')
    item_dict['image_detail_url'] = f'images/item{pk}_detail.jpg'
    time.sleep(3)

  except Exception as e:
    error_cnt += 1
    print(
      f'====================error_cnt: {error_cnt}============================')

  # append
  print(item_dict)
  items.append(item_dict)
  pk += 1
