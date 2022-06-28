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
