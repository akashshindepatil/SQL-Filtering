/*1. Display the total bill amount for each department, showing only departments with a 
total bill greater than ₹200,000. Sort the results from highest to lowest bill amount.*/
SELECT department,
sum(bill_amount) as total_bill_amount
from hospital_patients
group by department
having total_bill_amount > 200000
order by total_bill_amount desc;


/*2. Find the average bill amount for each doctor. Display only doctors whose average 
bill is greater than ₹50,000. Sort by average bill in descending order.*/
SELECT doctor_name,
avg(bill_amount) as avg_bill_amount
from hospital_patients
group by doctor_name
having avg_bill_amount > 50000
order by avg_bill_amount desc;

/*3. Display the number of patients in each department. Show only departments having 
more than 2 patients. Sort by patient count in descending order.*/
SELECT department,
count(*) as total_patient
from hospital_patients
group by department
having total_patient > 2
order by total_patient desc;

/*4. Find the total number of patients treated by each doctor. Display only doctors
 who treated more than 3 patients. Sort by patient count in ascending order.*/
 SELECT doctor_name,
 count(*) as total_patient
 from hospital_patients
 group by doctor_name
 having total_patient > 3
 order by total_patient asc;
 
/*5. Display the total bill amount for each payment status. Sort by total bill 
amount from highest to lowest.*/
SELECT payment_status,
sum(bill_amount) as total_bill
from hospital_patients
group by payment_status
order by total_bill desc;

/*6. Find the average age of patients in each department. Display departments where
 average age is greater than 40. Sort by average age descending.*/
 SELECT department,
 avg(age) as Avg_age
 from hospital_patients
 group by department
 having Avg_age > 40
 order by Avg_age desc;
 
/*7. Display departments having more than 2 patients with the Pending payment status.
 Sort by number of pending patients descending.*/
 SELECT department,
 count(*) as pending_pay
 from hospital_patients
 where payment_status = "Pending"
 group by department
 having pending_pay > 1
 order by pending_pay desc;
 
 
/*8. Find the total bill amount for each diagnosis. Display diagnoses with total bills
 greater than ₹100,000. Sort by total bill descending.*/
 SELECT diagnosis,
 sum(bill_amount) as total_bill
 from hospital_patients
 group by diagnosis
 having total_bill > 100000
 order by total_bill desc;
 
/*9. Find the number of male and female patients in each department. Display only groups having
 more than 1 patient. Sort by patient count descending*/
 SELECT department,gender,
 count(*) as total_patient
 from hospital_patients
 group by department,gender
 having count(*) > 1 
 order by total_patient desc;
 
/*10. Display the total number of patients and average bill amount for each department. Show only
departments having more than 2 patients. Sort by average bill amount descending.*/
SELECT department,
count(*) as total_patient , avg(bill_amount)as avg_bill_amount
from hospital_patients
group by department
having total_patient > 2
order by avg_bill_amount desc;
