import streamlit as st
import psycopg2
import pandas as pd
from streamlit_option_menu import option_menu
import warnings
import logging

logging.basicConfig(level=logging.DEBUG)


# Suppress warnings if you are sure they are benign
warnings.filterwarnings("ignore")

@st.cache_resource

def init_connection():
    try:
        return psycopg2.connect(**st.secrets["postgres"])
    except psycopg2.Error as e:
        st.error(f"Error connecting to PostgreSQL: {e}")
        return None

@st.cache_data

def run_query(query):
    conn = init_connection()
    if conn is not None:
        try:
            with conn.cursor() as cur:
                cur.execute(query)
                if query.strip().lower().startswith('select'):
                    results = cur.fetchall()
                    logging.debug("Query results: %s", results)
                    return results
                else:
                    conn.commit()
                    return f"Query executed successfully. Rows affected: {cur.rowcount}"
        except psycopg2.Error as e:
            st.error(f"Error executing query: {e}")
            logging.error("Error executing query: %s", e)
            return None
    return []


def streamlit_menu():
    with st.sidebar:
        selected = option_menu(
            menu_title="Main Menu",  # required
            options=["Student Basic Info", "Gender Statistics", "Student with Aid", "Custom Query"],  # required
            menu_icon="cast",  # optional
            default_index=0  # optional
        )
    return selected

def handle_selected_option(selected):
    if selected == "Student Basic Info":
        query = "SELECT s.StudentID, s.Age, s.Gender, pm.MethodName FROM Students s LEFT JOIN Payment_preferences pp ON s.StudentID = pp.StudentID LEFT JOIN Payment_methods pm ON pp.MethodID = pm.MethodID"
        results = run_query(query)
        if results:
            df = pd.DataFrame(results, columns=['ID','Age','Gender','Pay Method'])
            st.table(df)
        else:
            st.error("Failed to fetch data or no data available.")

    if selected == "Gender Statistics":
        query = "SELECT s.Gender, AVG(mi.MonthlyIncome) AS Avg_Income FROM Students s INNER JOIN Monthly_income mi ON s.StudentID = mi.StudentID GROUP BY s.Gender "
        results = run_query(query)
        if results:
            df = pd.DataFrame(results, columns=['Gender','Average Monthly Income'])
            st.table(df)
        else:
            st.error("Failed to fetch data or no data available.")

    if selected == "Student with Aid":
        query = "SELECT s.StudentID, s.Age, s.Gender, a.AcademicYear, sc.ScholarshipName, g.GrantName, l.LoanProvider FROM Students s LEFT JOIN FinancialAid_Records f ON s.StudentID = f.StudentID LEFT JOIN Academic_years a ON f.AcademicYearID = a.AcademicYearID LEFT JOIN Scholarships sc ON f.ScholarshipID = sc.ScholarshipID LEFT JOIN Grants g ON f.GrantID = g.GrantID LEFT JOIN Loans l ON f.LoanID = l.LoanID WHERE CAST(s.Age AS INTEGER) BETWEEN 18 AND 22 AND (sc.ScholarshipAmount > 1000 OR g.GrantAmount > 5000) "
        results = run_query(query)
        if results:
            df = pd.DataFrame(results, columns=['ID','Age', 'Gender', 'Academic Year','Scholarship Name','Grant Name', 'Loan Provider'])
            st.table(df)
        else:
            st.error("Failed to fetch data or no data available.")
    # Add further handling for other menu options like "Gender Statistics", "Student with Aid", etc.


def main():
    # st.title("Student Management System")
    # st.sidebar.subheader("Login")
    # user_id = st.sidebar.text_input("User ID", value="", max_chars=10)
    # password = st.sidebar.text_input("Password", type="password")
    # login_button = st.sidebar.button("Login")

    # # Initialize user_session_key before the conditional statement
    # user_session_key = f"{user_id}_{password}"

    # if login_button:
    #     st.session_state[user_session_key] = True  # Set session state for logged-in user

    # # Now, user_session_key will always be initialized before this check
    # if st.session_state.get(user_session_key, False):
    #     selected = streamlit_menu()
    #     handle_selected_option(selected)  # See below for implementation

    # Sidebar for login and menu
    st.title("Student Finance Database")
    st.divider()
    with st.sidebar:
        st.subheader("Login:")
        user_id = st.text_input("User ID", value="", max_chars=10)
        password = st.text_input("Password", type="password")
        login_button = st.button("Login")

        # User session management
        user_session_key = f"user_{user_id}"

        student_session_key = "user_{user_id}"
        if login_button:
            # This should ideally check against hashed passwords in the database
            if user_id == "admin" and password == "admin":  # Simplified check for demonstration
                st.session_state[user_session_key] = True
                st.success('Admin Login successful!')
            elif user_id == password:
                rows = run_query(f"SELECT DISTINCT * from STUDENTS s LEFT JOIN FinancialAid_Records f ON s.studentid=f.studentid LEFT JOIN Academic_years a ON f.academicyearid=a.academicyearid LEFT JOIN scholarships sc ON f.scholarshipID = sc.scholarshipid LEFT JOIN Grants g ON f.grantid=g.grantid LEFT JOIN Loans l on f.loanid=l.loanid WHERE s.studentid={user_id} AND s.studentid={password}")
                st.session_state[student_session_key] = True
                st.success('User Login successful')
        
        # Displaying the main menu
        menu_options = ["Student Basic Info", "Gender Statistics", "Student with Aid", "Custom Query"]
        selected = option_menu("Main Menu", menu_options, menu_icon="cast", default_index=0)

    if st.session_state.get(student_session_key, False):
        st.subheader('Student Login')
        rows = run_query(f"SELECT DISTINCT * from STUDENTS s LEFT JOIN FinancialAid_Records f ON s.studentid=f.studentid LEFT JOIN Academic_years a ON f.academicyearid=a.academicyearid LEFT JOIN scholarships sc ON f.scholarshipID = sc.scholarshipid LEFT JOIN Grants g ON f.grantid=g.grantid LEFT JOIN Loans l on f.loanid=l.loanid WHERE s.studentid={user_id} AND s.studentid={password}")
        if rows:
            # data = pd.DataFrame(rows, columns=['ID','Age','Gender','Year in school','major','financial record id','academicyearid','scholarship',''])
            data=pd.DataFrame(rows)
            id = data.iloc[0,0]
            age = st.text_input("Your Age", value=data.loc[0,1], max_chars=100)
            gender = st.text_input("Gender", value=data.loc[0,2], max_chars=100)
            yr = st.text_input("Year in School", value=data.loc[0,3], max_chars=100, disabled=True)
            major = st.text_input("Major", value=data.loc[0,4], max_chars=100, disabled=True)
            academic_year = st.text_input("Academic Year", value=data.loc[0,13], max_chars=100, disabled=True)
            scholarship = st.text_input("Scholarhsip name", value=data.loc[0,15], max_chars=100, disabled=True)
            scholar_amt = st.text_input("Scholarhsip Amount", value=data.loc[0,16], max_chars=100, disabled=True)
            grant_name = st.text_input("Grant Name", value=data.loc[0,18], max_chars=100, disabled=True)
            grant_amt = st.text_input("Grant Amount", value=data.loc[0,19], max_chars=100, disabled=True)
            loan_provider = st.text_input("Loan Provider", value=data.loc[0,21], max_chars=100, disabled=True)
            int_rate = st.text_input("Interest Rate", value=data.loc[0,22], max_chars=100, disabled=True)
        


    # Handling actions based on selected menu option
    if st.session_state.get(user_session_key, False):
        st.subheader(f"Details for {selected}")
        
        if selected == "Student Basic Info":
            query = "SELECT s.StudentID, s.Age, s.Gender, pm.MethodName FROM Students s LEFT JOIN Payment_preferences pp ON s.StudentID = pp.StudentID LEFT JOIN Payment_methods pm ON pp.MethodID = pm.MethodID"
            results = run_query(query)
            if results:
                df = pd.DataFrame(results, columns=['Student ID', 'Age', 'Gender', 'Payment Method'])
                st.table(df)
            else:
                st.error("Failed to fetch data or no data available.")

    
        if selected == "Gender Statistics":
            query = "SELECT s.Gender, AVG(mi.MonthlyIncome) AS Avg_Income FROM Students s INNER JOIN Monthly_income mi ON s.StudentID = mi.StudentID GROUP BY s.Gender "
            results = run_query(query)
            if results:
                df = pd.DataFrame(results, columns=['Gender','Average Monthly Income'])
                st.table(df)
            else:
                st.error("Failed to fetch data or no data available.")

        if selected == "Student with Aid":
            query = "SELECT s.StudentID, s.Age, s.Gender, a.AcademicYear, sc.ScholarshipName, g.GrantName, l.LoanProvider FROM Students s LEFT JOIN FinancialAid_Records f ON s.StudentID = f.StudentID LEFT JOIN Academic_years a ON f.AcademicYearID = a.AcademicYearID LEFT JOIN Scholarships sc ON f.ScholarshipID = sc.ScholarshipID LEFT JOIN Grants g ON f.GrantID = g.GrantID LEFT JOIN Loans l ON f.LoanID = l.LoanID WHERE CAST(s.Age AS INTEGER) BETWEEN 18 AND 22 AND (sc.ScholarshipAmount > 1000 OR g.GrantAmount > 5000) "
            results = run_query(query)
            if results:
                df = pd.DataFrame(results, columns=['ID','Age', 'Gender', 'Academic Year','Scholarship Name','Grant Name', 'Loan Provider'])
                st.table(df)
            else:
                st.error("Failed to fetch data or no data available.")

        if selected == "Custom Query":
            # cust_query = st.text_input("Enter custom query", value="", max_chars=100)
            cust_query= st.text_input("Enter custom query", value="", max_chars=500)
            if st.button("Execute Query"):
                results = run_query(cust_query)
                if results:
                    if "Query executed successfully" in results:
                        st.success(results)
                    else:
                        st.table(pd.DataFrame(results))  # Assuming SELECT query results
                else:
                    st.error("Failed to execute query or no data available.")
        # Additional conditions for other menu options

if __name__ == "__main__":
    main()


