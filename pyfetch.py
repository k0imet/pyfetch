import json
import requests
import sys

def get_cve(url):
    # Get request
    req = requests.get(url)
    req.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0'

    # JSON unmarshalling
    result = json.loads(req.text)
    data = result['data']

    for value in data:
        print(value['cve'])

def get_cve_info(url):
    # Get request
    req = requests.get(url)
    req.headers['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0'

    # JSON unmarshalling
    result = json.loads(req.text)
    data = result['data']

    for value in data:
        cve = value['cve']
        cve_info = value['description']
        cve_severity = value['severity']
        print(f"{cve}\nDescription: {cve_info}\nSeverity: {cve_severity}")
        print("-----------------------------------")

def main():
    if len(sys.argv) < 2:
        print('Usage: gofetch day|week [-info]')
        return
    elif sys.argv[1] == 'day':
        if len(sys.argv) == 3 and sys.argv[2] == '-info':
            url = 'https://cvetrends.com/api/cves/24hrs'
            get_cve_info(url)
        else:
            url = 'https://cvetrends.com/api/cves/24hrs'
            get_cve(url)
    elif sys.argv[1] == 'week':
        if len(sys.argv) == 3 and sys.argv[2] == '-info':
            url = 'https://cvetrends.com/api/cves/order-by-tweets-7days'
            get_cve_info(url)
        else:
            url = 'https://cvetrends.com/api/cves/order-by-tweets-7days'
            get_cve(url)
    else:
        print('Usage: gofetch day|week [-info]')
        return

if __name__ == '__main__':
    main()
