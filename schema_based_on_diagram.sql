CREATE DATABASE clinic;

CREATE TABLE patients (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL NOT NULL PRIMARY KEY,
    addmitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(250),
    constraint fK_patient_id foreign key(fK_patient_id) references 
     patients(id)
);

CREATE TABLE treatments (
    id SERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(250) NOT NULL,
    name VARCHAR(250)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY NOT NULL,
    total-amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_histories_id INT NOT NULL,
    constraint fK_medical_histories_id foreign key(fk_medical_histories_id) references medical_histories(id)
);

CREATE TABLE invoice_items (
   id SERIAL PRIMARY KEY,
   unit_price DECIMAL NOT NULL,
   quantity INT NOT NULL,
   total_price DECIMAL NOT NULL,
   invoice_id INT,
   treatments_id INT,
   constraint fk_invoice_id foreign key(fk_invoice_id) references invoices(id),
   constraint fk_treatments_id foreign key(fk_treatments_id) references treatments(id),
);

CREATE TABLE medical_histories_treatment (
    medical_histories_id INT PRIMARY KEY NOT NULL,
    treatments_id INT PRIMARY KEY NOT NULL,
    constraint medical_histories_id foreign key(medical_histories_id) references 
    medical_histories(id), 
    constraint treatments_id foreign key(treatments_id) references treatments(id)
);


CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_histories_id);
CREATE INDEX ON invoice_items(invoice_id);
CREATE INDEX ON invoice_items(treatments_id);
CREATE INDEX ON medical_histories_treatment(medical_histories_id);
CREATE INDEX ON medical_histories_treatment(treatments_id);