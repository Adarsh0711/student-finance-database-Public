﻿
## Student Finance Database
*Student finances through our intuitive web application, facilitating informed decision-making and personalized support.*

![image](https://github.com/dharma-acha/student_finance_database/assets/100557655/1622fe39-56af-4749-a9c2-c399a2911c3e)

![image](https://github.com/dharma-acha/student_finance_database/assets/100557655/9aaee120-b2e4-4834-b555-774a8d9f0df3)


### About

The primary goal of this project is to develop an advanced database management system for effectively capturing, organizing, and analyzing the financial data of 10,000 students. This system aims to support educational institutions, financial advisors, and other stakeholders in understanding student spending habits, financial needs, and patterns to enhance academic achievement, student retention, and overall well-being.

### Key Features

**1. Efficient Data Collection:**

* Capture detailed financial data from students, including demographics (age, gender, year in school, major) and monthly income.
* Record financial aid received and expenses across various categories such as tuition, housing, food, transportation, books and supplies, entertainment, personal care, technology, health and wellness, and miscellaneous expenses.
* Track preferred payment methods for each student.

**2. Secure Storage:**

* Implement robust security measures to ensure the confidentiality and integrity of sensitive student financial data.
* Use encryption and secure access protocols to protect data from unauthorized access and breaches.

**3. Optimized Data Retrieval:**

* Design efficient query mechanisms to facilitate fast and accurate data retrieval.
* Support complex queries to analyze spending patterns, identify financial needs, and generate insightful reports.

**4. Data Analysis and Reporting:**

* Provide analytical tools to assess the impact of financial habits on academic performance and retention rates.
* Generate customizable reports to help stakeholders make data-driven decisions.
* Use data visualization techniques to present insights in an easily understandable format.

**5. User Accessibility:**

* Develop a user-friendly interface for educational institutions, financial advisors, and other stakeholders to interact with the system.
* Ensure the system is scalable to accommodate a growing number of users and data entries.

### Dataset Overview

**Source:** Kaggle

This dataset contains data representing the spending habits of 1000 students across various demographic groups and academic backgrounds.The dataset includes information such as age, gender, year in school, major, monthly income, financial aid received, and expenses in different spending categories.Spending categories include tuition, housing, food, transportation, books & supplies, entertainment, personal care, technology, health & wellness, and miscellaneous expenses. Additionally, the dataset includes the preferred payment method for each student.

### Technologies used

1. PostgreSQL
2. Python
3. Streamlit

### Entity Relationship Diagram

![image](https://github.com/dharma-acha/student_finance_database/assets/100557655/f5777d23-4a85-4c6b-8c66-830dc20b69bc)

### Getting Started

#### Installation steps

1. Install PostgreSQL.
2. Set the path in environment variables.
3. Set the port to 5432
4. Set the username as 'postgres'
5. Load the data file 'load.sql' using command 'pg_dump -U <username> -d (databasename) -f (outputfile.sql)'
6. run the app using 'streamlit run <filename.py>'

See the report for more details

### License

Free to use, no restrictions

### Contact

If you have any questions or comments, feel free to contact me on [Email](mailto:adarshreddybandaru@gmail.com)


