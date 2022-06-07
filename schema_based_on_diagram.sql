CREATE TABLE patients(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	data_of_birth DATE,
	PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at DATE,
	patient_id INT,
	status VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE treatments(
	id INT GENERATED ALWAYS AS IDENTITY,
	type VARCHAR(255),
	name VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE invoices(
	id INT GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL,
	generated_at DATE,
	payed_at DATE,
	medical_history_id INT,
	PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
	id INT GENERATED ALWAYS AS IDENTITY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoices_id INT,
	treatment_id int,
	PRIMARY KEY(id)
);

CREATE TABLE histories_treatment(
	id INT GENERATED ALWAYS AS IDENTITY,
	treatment_id INT,
	medical_history_id INT,
	CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id),
	CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
	PRIMARY KEY(id, treatment_id, medical_history_id)
);
