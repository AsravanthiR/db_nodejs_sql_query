SELECT * FROM certificates
INSERT INTO certificates (name,person_id) VALUES ($1, $2)

import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB(cert, number) {
  const values = [cert, number];
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "INSERT INTO certificates (name,person_id) VALUES ($1, $2) RETURNING *",
    values
  );
  console.table(res.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB("scrum", 2);
--------------------------------------------------------------------------------------------------------

import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB(name, age, id) {
  const values = [name, age, id];
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "UPDATE person SET name= $1,age= $2 WHERE id= $3",
    values
  );
  const res1 = await client.query("SELECT * FROM person");
  console.table(res.rows);

  console.table(res1.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB("Emilia", 25, 2);
-------------------------------------------------------------------------------------------------------
import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB(name, person_id, id) {
  const values = [name, person_id, id];
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "UPDATE certificates SET name= $1, person_id=$2 WHERE id= $3",
    values
  );
  const res1 = await client.query("SELECT * FROM certificates");
  console.table(res.rows);

  console.table(res1.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB("AWS", 2, 2);
----------------------------------------------------------------------------------------------------
Create db connection
connect to db use connect

Start the transaction using beginTransaction

execute transactional queries
If any query fails use rollback. This will abort the transaction.
if all goes well use commit
close the connection use end
---------------------------------------------------------------------------------

import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB(person_id) {
  const values = [person_id];
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "DELETE FROM certificates WHERE person_id=$1 ",
    values
  );
  const res1 = await client.query("SELECT * FROM certificates");
  console.table(res.rows);

  console.table(res1.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB(5);
---------------------------------------------------------------------
import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB() {
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "CREATE TABLE customers(name VARCHAR(255), address VARCHAR(255))"
  );

  console.table(res.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB();
------------------------------------------------------------------------
create table

import "dotenv/config";
import pkg from "pg";

const { Client } = pkg;

//await connectDB();
async function connectDB(name, adress) {
  const values = [name, adress];
  const client = new Client({
    connectionString: process.env.DB_CONNECTIONSTRING,
  });
  await client.connect();
  const res = await client.query(
    "INSERT INTO customers (name,address) VALUES ($1, $2) RETURNING *",
    values
  );
  console.table(res.rows);

  //res.rows.forEach((person) => console.log(person));
  await client.end();
}
connectDB("Bunny", "xyz");

