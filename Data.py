import requests
session = requests.Session()
School_url = "http://localhost/dashboard.php"
login_url="http://localhost/login.php"

username = "vipolus"
password = "vipolus"

# Perform login request
payload = {
    "username": username,
    "password": password
}

response = requests.post(login_url, data=payload)

response = session.get('http://localhost/index.php')
print(session.cookies.get_dict())


#school_1 = "1o Gel Bolos"
#school_2 = "4o Epal Peiraias"
#school_3 = "2o Gel Kozanh"
#operator_1 = "Operator_Bolos"
#operator_2 = "Operator_Peiraias"
#operator_3 = "Operator_Kozanh"
#
#payload = {
#    "action": "add_school",
#    "school_name": school_3,
#    "address": school_3,
#    "city": school_3,
#    "phone_number": "321321",
#    "email": school_3 + '@' + school_3 + '.com',
#    "full_name_of_school_director": operator_3
#}
#
#
#response = requests.post(School_url, data=payload, cookies=cookies)
#
#if response.status_code == 200:
#    print(response.content)
#else:
#    print("School registration failed.")
#
#
#school_1 = "1o Gel Bolos"
#school_2 = "4o Epal Peiraias"
#school_3 = "2o Gel Kozanh"
#operator_1 = "Operator_Bolos"
#operator_2 = "Operator_Peiraias"
#operator_3 = "Operator_Kozanh"
#
#reg_url="http://localhost/registration.php"
#
#
#data = {
#    'username': operator_3,
#    'email': operator_3 +'@'+operator_3+'.com',
#    'password': operator_3,
#    'password-repeat': operator_3,
#    'yob': '1990',  
#    'First_Name': operator_3,
#    'Last_Name': operator_3,
#    'role': 'Library Operator',  # Replace with the desired role
#    'nameSelect': school_3  # Replace with the desired school name
#}
#
#response = requests.post(reg_url, data=data)
#
#if response.status_code == 200:
#    cookies = response.headers.get('Cookie')
#    print("Cookies:", cookies)
#    print('Registration successful!')
#else:
#    print('Registration failed. Status code:', response.status_code)
#    print('Response:', response.text)
#
#