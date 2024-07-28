--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academic_years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_years (
    academicyearid integer NOT NULL,
    academicyear character varying(40) NOT NULL
);


ALTER TABLE public.academic_years OWNER TO postgres;

--
-- Name: Academic_Years_AcademicYearID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Academic_Years_AcademicYearID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Academic_Years_AcademicYearID_seq" OWNER TO postgres;

--
-- Name: Academic_Years_AcademicYearID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Academic_Years_AcademicYearID_seq" OWNED BY public.academic_years.academicyearid;


--
-- Name: category_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_mapping (
    categoryid integer NOT NULL,
    categoryname character varying NOT NULL
);


ALTER TABLE public.category_mapping OWNER TO postgres;

--
-- Name: Category_Mapping_CategoryID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Category_Mapping_CategoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Category_Mapping_CategoryID_seq" OWNER TO postgres;

--
-- Name: Category_Mapping_CategoryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Category_Mapping_CategoryID_seq" OWNED BY public.category_mapping.categoryid;


--
-- Name: financialaid_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.financialaid_records (
    financialrecordid integer NOT NULL,
    studentid integer,
    academicyearid integer,
    scholarshipid integer,
    grantid integer,
    loanid integer,
    workstudyid integer
);


ALTER TABLE public.financialaid_records OWNER TO postgres;

--
-- Name: FinancialAid_Records_FinancialRecordID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FinancialAid_Records_FinancialRecordID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."FinancialAid_Records_FinancialRecordID_seq" OWNER TO postgres;

--
-- Name: FinancialAid_Records_FinancialRecordID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FinancialAid_Records_FinancialRecordID_seq" OWNED BY public.financialaid_records.financialrecordid;


--
-- Name: grants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grants (
    grantid integer NOT NULL,
    grantname character varying NOT NULL,
    grantamount numeric NOT NULL
);


ALTER TABLE public.grants OWNER TO postgres;

--
-- Name: Grants_GrantID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Grants_GrantID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Grants_GrantID_seq" OWNER TO postgres;

--
-- Name: Grants_GrantID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Grants_GrantID_seq" OWNED BY public.grants.grantid;


--
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    loanid integer NOT NULL,
    loanprovider character varying NOT NULL,
    loanamount numeric NOT NULL,
    interestrate numeric NOT NULL
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- Name: Loans_LoanID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Loans_LoanID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Loans_LoanID_seq" OWNER TO postgres;

--
-- Name: Loans_LoanID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Loans_LoanID_seq" OWNED BY public.loans.loanid;


--
-- Name: monthly_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monthly_income (
    monthlyincomeid integer NOT NULL,
    studentid integer NOT NULL,
    monthlyincome numeric NOT NULL,
    month character varying NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.monthly_income OWNER TO postgres;

--
-- Name: Monthly_Income_MonthlyIncomeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Monthly_Income_MonthlyIncomeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Monthly_Income_MonthlyIncomeID_seq" OWNER TO postgres;

--
-- Name: Monthly_Income_MonthlyIncomeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Monthly_Income_MonthlyIncomeID_seq" OWNED BY public.monthly_income.monthlyincomeid;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    methodid integer NOT NULL,
    methodname character varying NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- Name: Payment_Methods_MethodID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Payment_Methods_MethodID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Payment_Methods_MethodID_seq" OWNER TO postgres;

--
-- Name: Payment_Methods_MethodID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Payment_Methods_MethodID_seq" OWNED BY public.payment_methods.methodid;


--
-- Name: scholarships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scholarships (
    scholarshipid integer NOT NULL,
    scholarshipname character varying(50) NOT NULL,
    scholarshipamount numeric NOT NULL
);


ALTER TABLE public.scholarships OWNER TO postgres;

--
-- Name: Scholarships_ScholarshipID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Scholarships_ScholarshipID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Scholarships_ScholarshipID_seq" OWNER TO postgres;

--
-- Name: Scholarships_ScholarshipID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Scholarships_ScholarshipID_seq" OWNED BY public.scholarships.scholarshipid;


--
-- Name: students_spending; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_spending (
    spendingid integer NOT NULL,
    studentid integer NOT NULL,
    categoryid integer,
    month character varying NOT NULL,
    year integer NOT NULL,
    amount numeric NOT NULL
);


ALTER TABLE public.students_spending OWNER TO postgres;

--
-- Name: Students_Spending_SpendingID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Students_Spending_SpendingID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Students_Spending_SpendingID_seq" OWNER TO postgres;

--
-- Name: Students_Spending_SpendingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Students_Spending_SpendingID_seq" OWNED BY public.students_spending.spendingid;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    studentid integer NOT NULL,
    age character varying(40) NOT NULL,
    gender character varying(40) NOT NULL,
    yearinschool character varying(40) NOT NULL,
    major character varying(40) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: Students_StudentID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Students_StudentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Students_StudentID_seq" OWNER TO postgres;

--
-- Name: Students_StudentID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Students_StudentID_seq" OWNED BY public.students.studentid;


--
-- Name: workstudy_programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workstudy_programs (
    workstudyid integer NOT NULL,
    programname character varying NOT NULL,
    department character varying NOT NULL,
    hourlyrate numeric NOT NULL,
    hoursperweek integer NOT NULL
);


ALTER TABLE public.workstudy_programs OWNER TO postgres;

--
-- Name: Work_Study_Programs_WorkStudyID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Work_Study_Programs_WorkStudyID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Work_Study_Programs_WorkStudyID_seq" OWNER TO postgres;

--
-- Name: Work_Study_Programs_WorkStudyID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Work_Study_Programs_WorkStudyID_seq" OWNED BY public.workstudy_programs.workstudyid;


--
-- Name: payment_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_preferences (
    studentid integer NOT NULL,
    methodid integer NOT NULL
);


ALTER TABLE public.payment_preferences OWNER TO postgres;

--
-- Name: academic_years academicyearid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years ALTER COLUMN academicyearid SET DEFAULT nextval('public."Academic_Years_AcademicYearID_seq"'::regclass);


--
-- Name: category_mapping categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_mapping ALTER COLUMN categoryid SET DEFAULT nextval('public."Category_Mapping_CategoryID_seq"'::regclass);


--
-- Name: financialaid_records financialrecordid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financialaid_records ALTER COLUMN financialrecordid SET DEFAULT nextval('public."FinancialAid_Records_FinancialRecordID_seq"'::regclass);


--
-- Name: grants grantid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grants ALTER COLUMN grantid SET DEFAULT nextval('public."Grants_GrantID_seq"'::regclass);


--
-- Name: loans loanid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN loanid SET DEFAULT nextval('public."Loans_LoanID_seq"'::regclass);


--
-- Name: monthly_income monthlyincomeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monthly_income ALTER COLUMN monthlyincomeid SET DEFAULT nextval('public."Monthly_Income_MonthlyIncomeID_seq"'::regclass);


--
-- Name: payment_methods methodid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN methodid SET DEFAULT nextval('public."Payment_Methods_MethodID_seq"'::regclass);


--
-- Name: scholarships scholarshipid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scholarships ALTER COLUMN scholarshipid SET DEFAULT nextval('public."Scholarships_ScholarshipID_seq"'::regclass);


--
-- Name: students studentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN studentid SET DEFAULT nextval('public."Students_StudentID_seq"'::regclass);


--
-- Name: students_spending spendingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_spending ALTER COLUMN spendingid SET DEFAULT nextval('public."Students_Spending_SpendingID_seq"'::regclass);


--
-- Name: workstudy_programs workstudyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workstudy_programs ALTER COLUMN workstudyid SET DEFAULT nextval('public."Work_Study_Programs_WorkStudyID_seq"'::regclass);

