# Electronic-Medical-Record
Mock EMR for an emergency room written in MySQL

Purpose

Electronic Medical Records (EMRs) provide hospitals with a way to keep track of all the pertinent data. It’s important for hospitals to have these systems because of the severity of the work that is done and for the health and safety of all the patients and staff. The quality of care improves immensely as technology advances, but with these comes more data that needs to be tracked and accessed frequently, which is where EMRs come in.

Overview

This project includes a design of a database system, EMRs, which is used in a hospital to keep track of the data. The system works by when a patient is admitted to the hospital, they will be placed into one of the various departments and given a primary doctor who administers their care. Based on which department they are sent to will determine the room they stay in. The room table will update to express that it is occupied. At the end of their stay, an invoice will be created which will be updated by off what supplies and medicines were used for the patient. The primary focus of this system is to keep a track of who the patients are, which departments were they placed in, and which doctor provides the patient with care. The secondary function is to keep track of what supplies are used during the visit and have a detailed list of supplies which also places importance on an adequate amount of items for each supply.

Scope

The goal of this project is to design a database system which will maintain and hold all the information related to a patient being admitted to a hospital. It will be designed in such a way that the patient will have relationships between what doctor treated them, the room they stayed in, and which department that room was in.

Functional Requirements

There are 9 tables that holds all the data in the system and they include Patients, Employees, Addresses/Contact Info, Insurance Companies, Invoices, Rooms, Departments, Supplies, and Suppliers.
