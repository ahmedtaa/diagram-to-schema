-- Patients table
CREATE TABLE patients(
   id             SERIAL PRIMARY KEY NOT NULL,
   NAME           VARCHAR(100)       NOT NULL,
   date_of_birth  DATE               NOT NULL   
);

-- Medical history table
CREATE TABLE medical_histories(
   id           SERIAL PRIMARY KEY  NOT NULL,
   admitted_at  TIME                NOT NULL,
   patient_id   INT                 NOT NULL,
   status       VARCHAR(100)        NOT NULL,
   foreign key (patient_id)  references patients(id) ON DELETE cascade
);

-- Invoices table 
CREATE TABLE invoices(
   id SERIAL PRIMARY KEY     NOT NULL,
   total_amount DECIMAL NOT NULL,
   generated_at TIME NOT NULL,
   payed_at TIME NOT NULL,
   medical_history_id INT NOT NULL,
   foreign key (medical_history_id)   references medical_histories(id) ON DELETE cascade
);

-- Treatments table
CREATE TABLE treatments(
   id            SERIAL PRIMARY KEY    NOT NULL,
   type          VARCHAR(100)          NOT NULL,
   NAME           VARCHAR(100)         NOT NULL,
);

-- Invoice_items table
CREATE TABLE invoice_items(
   id                  SERIAL PRIMARY KEY    NOT NULL,
   unit_price          DECIMAL               NOT NULL,
   quantity            INT                   NOT NULL,
   total_price         DECIMAL               NOT NULL,
   invoice_id          INT                   NOT NULL,
   treatment_id        INT                   NOT NULL,
   foreign key ( invoice_id ) references invoices(id) ON DELETE cascade,
   foreign key (treatment_id) references treatments(id) ON DELETE cascade
);

-- Table for medical histories and treatments (many-to-many relationship)
CREATE TABLE medical_histories_treatments (
   medical_history_id   INT NOT NULL,
   treatment_id         INT NOT NULL,
   foreign key (medical_history_id) references medical_histories(id) ON DELETE cascade,
   foreign key (treatment_id) references treatments(id) ON DELETE cascade
);
