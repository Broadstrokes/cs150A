/* */

/*
TASK 01

*/

Relationship was not established correctly.
Per Meade Rule #5 The foreign key should be in the Guest table
One room can belong to many Guests, therefore, room table 
loses and should not have foreign key.

Also since the RoomNum is the primary key, no two rows should
have the same value for RoomNum, as is the case with room 104. 
Primary key should be unique.

/*
TASK 02

*/

One guest can have many rooms and 
one room can belong to many guests. 
This is a many-to-many relationship.

HotelRoom table has a row with 
primary key as 500-599. This not a good way to store a primary key.
It will be hard to query, for example, finding who resides in room 
501


/*
TASK 03

*/

A) How could this design could potentially lead to errors in the data?
Data has been duplicated. Multiple row might have to be updated, which 
can lead to errors.


B) How could this design negatively impact the front desk personnel who have to use it?
Looking up and finding which room belongs to which customer will be problematic

C) Where is the redundancy in the data in these tables?
HotelRoom has 2 rows with 104 primary key

D) How could you change the table structures to remove the redundancy?
Create a transition table.


/*
TASK 04

*/


See attached PDF for how the data would reside in the database.
Since this is a many-to-many relationship, 3 tables would be created 
as follows:

Table: HOTELROOM
RoomNum NUMERIC(4, 0) CONSTRAINT HOTELROOM_pk PRIMARY KEY
type	VARCHAR(50) NOT NULL
price NUMERIC(6, 2) NOT NULL


Table: GUEST
GuestNum VARCHAR(50) CONSTRAINT GUEST_pk PRIMARY KEY
name	VARCHAR(50) NOT NULL
address VARCHAR(50) NOT NULL

Table: TRANSITION_TABLE
RoomNum	NUMERIC(4, 0) NOT NULL
GuestNum VARCHAR(50) NOT NULL
PRIMARY KEY(RoomNum, GuestNum), 
FOREIGN KEY(RoomNum) REFERENCES HOTELROOM, 
FOREIGN KEY(GuestNum) REFERENCES GUEST
