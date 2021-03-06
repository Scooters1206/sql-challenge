PGDMP                 	    
    x            sql-challenge    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24699    sql-challenge    DATABASE     s   CREATE DATABASE "sql-challenge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "sql-challenge";
                postgres    false            �            1259    25091    departments    TABLE     ~   CREATE TABLE public.departments (
    dept_no character varying(30) NOT NULL,
    dept_name character varying(30) NOT NULL
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    25131    dept_employee    TABLE     o   CREATE TABLE public.dept_employee (
    emp_no integer NOT NULL,
    dept_no character varying(30) NOT NULL
);
 !   DROP TABLE public.dept_employee;
       public         heap    postgres    false            �            1259    25111    dept_manager    TABLE     n   CREATE TABLE public.dept_manager (
    dept_no character varying(30) NOT NULL,
    emp_no integer NOT NULL
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false            �            1259    25101 	   employees    TABLE     -  CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title character varying(30) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    sex character varying(30) NOT NULL,
    hire_date date NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    25096    salaries    TABLE     [   CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);
    DROP TABLE public.salaries;
       public         heap    postgres    false            �            1259    25081    titles    TABLE     v   CREATE TABLE public.titles (
    title_id character varying(30) NOT NULL,
    title character varying(30) NOT NULL
);
    DROP TABLE public.titles;
       public         heap    postgres    false            7           2606    25095    departments departments_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    201            =           2606    25115    dept_manager dept_manager_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no);
 H   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_pkey;
       public            postgres    false    204    204            ;           2606    25105    employees employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    203            9           2606    25100    salaries salaries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);
 @   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_pkey;
       public            postgres    false    202            5           2606    25085    titles titles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);
 <   ALTER TABLE ONLY public.titles DROP CONSTRAINT titles_pkey;
       public            postgres    false    200            @           2606    25121 &   dept_manager dept_manager_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 P   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_dept_no_fkey;
       public          postgres    false    201    204    2871            ?           2606    25116 %   dept_manager dept_manager_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 O   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_emp_no_fkey;
       public          postgres    false    2875    204    203            >           2606    25106 "   employees employees_emp_title_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_fkey FOREIGN KEY (emp_title) REFERENCES public.titles(title_id);
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_emp_title_fkey;
       public          postgres    false    2869    200    203           