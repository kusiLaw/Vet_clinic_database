DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS medical_histories;
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS medical_histories_treatments;


CREATE TABLE patients(
   id INT GENERATED ALWAYS AS IDENTITY,
   name    VARCHAR(100) NOT NULL,
   date_of_birth DATE NOT NULL,
   PRIMARY KEY(id)      
);

CREATE TABLE medical_histories (
 id INT GENERATED ALWAYS AS IDENTITY,
 admitted_at TIMESTAMP,
 patient_id INT NOT NULL,
 status VARCHAR(250) NOT NULL, 
 PRIMARY KEY(id),

 CONSTRAINT fk_patients 
 FOREIGN KEY(patient_id)
 REFERENCES patients (id)
 ON DELETE CASCADE
);

CREATE TABLE treatments (
 id INT GENERATED ALWAYS AS IDENTITY,
 type VARCHAR(250) NOT NULL,
 name VARCHAR(250) NOT NULL,
 PRIMARY KEY(id) 
);

CREATE TABLE invoices(
   id INT GENERATED ALWAYS AS IDENTITY,
   total_amount DECIMAL NOT NULL,
   generated_at TIMESTAMP NOT NULL,
   payed_at TIMESTAMP NOT NULL,
   medical_history_id INT NOT NULL,
   PRIMARY KEY(id),
  
  CONSTRAINT fk_medical_histories 
  FOREIGN KEY(medical_history_id)
  REFERENCES medical_histories (id)
  ON DELETE CASCADE     
);

