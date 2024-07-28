Python Script to generate dummy data:

import pandas as pd
import numpy as np


np.random.seed(0)


num_students = 5500
students = pd.DataFrame({
    "StudentID": np.arange(1, num_students + 1),
    "Age": np.random.randint(18, 25, size=num_students),
    "Gender": np.random.choice(['Male', 'Female', 'Other'], size=num_students),
    "YearInSchool": np.random.choice(['Freshman', 'Sophomore', 'Junior', 'Senior'], size=num_students),
    "Major": np.random.choice(['Business', 'Engineering', 'Arts', 'Science'], size=num_students)
})


academic_years = pd.DataFrame({
    "AcademicYearID": np.arange(1, 5),
    "AcademicYear": ['2020-2021', '2021-2022', '2022-2023', '2023-2024']
})


monthly_income = pd.DataFrame({
    "MonthlyIncomeID": np.arange(1, num_students + 1),
    "StudentID": np.random.choice(students['StudentID'], num_students),
    "MonthlyIncome": np.random.randint(500, 2000, size=num_students),
    "Month": np.random.choice(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'], size=num_students),
    "Year": np.random.choice(['2020', '2021', '2022', '2023'], size=num_students)
})


financial_aid_records = pd.DataFrame({
    "FinancialRecordID": np.arange(1, num_students + 1),
    "StudentID": np.random.choice(students['StudentID'], num_students),
    "AcademicYearID": np.random.choice(academic_years['AcademicYearID'], num_students),
    "ScholarshipID": np.random.choice([np.nan, 1, 2, 3, 4], size=num_students, p=[0.6, 0.1, 0.1, 0.1, 0.1]),
    "GrantID": np.random.choice([np.nan, 1, 2, 3, 4], size=num_students, p=[0.6, 0.1, 0.1, 0.1, 0.1]),
    "LoanID": np.random.choice([np.nan, 1, 2, 3, 4], size=num_students, p=[0.6, 0.1, 0.1, 0.1, 0.1]),
    "WorkStudyID": np.random.choice([np.nan, 1, 2, 3, 4], size=num_students, p=[0.6, 0.1, 0.1, 0.1, 0.1])
})



academic_years.head(), monthly_income.head(), financial_aid_records.head()

category_mapping = pd.DataFrame({
    "CategoryID": np.arange(1, 6),
    "CategoryName": ['Books', 'Food', 'Housing', 'Tuition', 'Transportation']
})


student_spending = pd.DataFrame({
    "SpendingID": np.arange(1, num_students + 1),
    "StudentID": np.random.choice(students['StudentID'], num_students),
    "CategoryID": np.random.choice(category_mapping['CategoryID'], num_students),
    "Month": np.random.choice(monthly_income['Month'], num_students),
    "Year": np.random.choice(monthly_income['Year'], num_students),
    "Amount": np.random.randint(100, 1000, size=num_students)
})

payment_methods = pd.DataFrame({
    "MethodID": np.arange(1, 6),
    "MethodName": ['Credit Card', 'Debit Card', 'PayPal', 'Check', 'Wire Transfer']
})


payment_preferences = pd.DataFrame({
    "StudentID": np.random.choice(students['StudentID'], num_students),
    "MethodID": np.random.choice(payment_methods['MethodID'], num_students)
})


scholarships = pd.DataFrame({
    "ScholarshipID": np.arange(1, 6),
    "ScholarshipName": ['Merit-Based', 'Athletic', 'Academic', 'Artistic', 'Science Grant'],
    "ScholarshipAmount": np.random.randint(500, 5000, size=5)
})


grants = pd.DataFrame({
    "GrantID": np.arange(1, 6),
    "GrantName": ['Federal Pell', 'State Grant', 'Private Grant', 'Research Grant', 'Minority Grant'],
    "GrantAmount": np.random.randint(500, 5000, size=5)
})

loans = pd.DataFrame({
    "LoanID": np.arange(1, 6),
    "LoanProvider": ['Federal Loan', 'Private Loan', 'State Loan', 'Subsidized Loan', 'Unsubsidized Loan'],
    "LoanAmount": np.random.randint(1000, 10000, size=5),
    "InterestRate": np.random.randint(1, 6, size=5)
})

workstudy_programs = pd.DataFrame({
    "WorkStudyID": np.arange(1, 6),
    "ProgramName": ['Library Assistant', 'Lab Technician', 'Campus Tour Guide', 'Athletics Department Helper', 'Dining Services Aide'],
    "Department": ['Library', 'Biology', 'Admissions', 'Athletics', 'Hospitality'],
    "HourlyRate": np.random.randint(10, 25, size=5),
    "HoursPerWeek": np.random.randint(5, 20, size=5)
})



{
    "Category_mapping": category_mapping.head(),
    "Student_spending": student_spending.head(),
    "Payment_methods": payment_methods.head(),
    "Payment_preferences": payment_preferences.head(),
    "Scholarships": scholarships.head(),
    "Grants": grants.head(),
    "Loans": loans.head(),
    "Workstudy_Programs": workstudy_programs.head()
}


We also uploaded create.sql and load.sql files for easy setup. Firstly, to create tables we import create.sql file in pgAdmin user interface application  and execute it under the respective database. Secondly, to load the dummy data, we run the following command:

psql -U postgres -d dmql_phase2 -f /Users/charankumarnara/Downloads/DMQL_Data/load.sql

Here dmql_phase2 is the database name and postgres is the username in pgAdmin.

