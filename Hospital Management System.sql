CREATE TABLE hospitals (
    hospitals_id bigint PRIMARY KEY NOT NULL,
    hospitals_name varchar(255) NOT NULL,
    hospitals_address varchar(255) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments
    -- staff_id bigint references staffs(staff_id),
    -- patient_id bigint references patients(patient_id),
    -- emergency_room_id bigint references emergency_rooms(emergency_room_id)
);

CREATE TABLE departments(
    department_id bigint PRIMARY KEY NOT NULL,
    department_name varchar(255) NOT NULL,
    department_count bigint NOT NULL,
    -- staff_id bigint references staffs(staff_id),
    hospital_id bigint references hospitals(hospital_id)
);

CREATE TABLE staffs(
    staff_id bigint PRIMARY KEY NOT NULL,
    staff_name varchar(255) NOT NULL,
    department_id bigint references departments(department_id),
    hospital_id bigint references hospitals(hospital_id),
    total_operations bigint NOT NULL, /* total operations performed by the staff */
    successful_operations bigint NOT NULL,
    emergency_room_id bigint references emergency_rooms(emergency_room_id)
);

CREATE TABLE patients(
    patient_id bigint PRIMARY KEY NOT NULL,
    patient_status varchar(255) NOT NULL,
    emergency_room_id bigint references emergency_rooms(emergency_room_id),
    department_id bigint references departments(department_id),
    staff_id bigint references staffs(staff_id),
    hospital_id bigint references hospitals(hospital_id),
    admit_date date NOT NULL,
    time_of_death timestamp,
    patient_phone text NOT NULL,
    joining_reason varchar(255) NOT NULL
);

CREATE TABLE emergency_rooms(
    emergency_room_id bigint PRIMARY KEY NOT NULL,
    staff_id bigint references staffs(staff_id),
    hospital_id bigint references hospitals(hospital_id),
    emergency_room_type varchar(255) NOT NULL,
    emergency_room_status varchar(255) NOT NULL,
    patient_id bigint references patients(patient_id),
    patient_count bigint NOT NULL, 
    max_capacity bigint NOT NULL
);
