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
