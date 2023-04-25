School:
School_id: int (primary)
School_Name: string 
Address: string 
City: string 
Phone_Number: string 
Email: string 
Full_Name_of_School_Director: string 
Full_Name_of_Responsible_School_Library_Operator: string 

School_Library_Operator:
School_id: int (primary) (foreign)->School
Name: string (primary)
email: string
Username: string 
Password: string 

Book:
Book_id: int (primary)
Title: string 
Publisher: string 
ISBN: int 
Number_of_Pages: integer 
Summary: text 
Image: string 
Thematic_Category: string 
Language: string 
Keywords: string 

Copies:
Copies_id: int (primary)
School_Name: string (foreign)->School
ISBN: int (foreign)->Book
Number_of_Available_Copies: integer 

Author:
ISBN: int (primary) (foreign)->Book
First_Name: string (primary)
Last_Name: string (primary)

Category:
Name: string (primary)

User:
User_id: int (primary)
Name: string 
Email: string 
Username: string 
Password: string 
Type: string 
Borrow_Limit: integer 
Review_Approval_Required: boolean 

Reservation:
Reservation_id: int (primary)
School_Name: string (foreign)->School
User_id: int (foreign)->User
ISBN: string (foreign)->Book
date_created: int
date_expired: int


Loan:
Loan_id: int (primary)
User_id: int (foreign)->User
Type: string
ISBN: string (foreign)->Book
date_borrowed: int
date_returned: int


Review:
ISBN: int (primary) (foreign)->Book
Rating: integer 
Text: text 
Name: string (primary)

Admin:
User_id: int
