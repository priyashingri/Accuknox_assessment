#4.Application Health Checker
import requests

# Configuration
URL = "http://www.google.com"
TIMEOUT = 5

def check_application_health():
    try:
        response = requests.get(URL, timeout=TIMEOUT)
        if response.status_code == 200:
            print("Application is up.")
        else:
            print(f"Application returned status code: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"Application is down. Error: {e}")

def main():
    check_application_health()

if __name__ == "__main__":
    main()
