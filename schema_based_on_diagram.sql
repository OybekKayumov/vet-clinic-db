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
