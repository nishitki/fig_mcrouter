def check_ssl(url):
    try:
        req = requests.get(url, verify=True)
        print url + ' has a valid SSL certificate!'
    except requests.exceptions.SSLError:
        print url + ' has INVALID SSL certificate!'

check_ssl('https://www.google.com')
check_ssl('https://example.com')
