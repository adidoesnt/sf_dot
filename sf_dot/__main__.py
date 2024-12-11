import pandas as pd;
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

DB_HOST=os.environ["DB_HOST"]
DB_PORT=os.environ["DB_PORT"]
DB_USER=os.environ["DB_USER"]
DB_NAME=os.environ["DB_NAME"]
DB_PASSWORD=os.environ["DB_PASSWORD"]

URI=f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
engine = create_engine(URI)
db = engine.connect()

filepaths = ['data/drivers.csv', 'data/ownerships.csv', 'data/vehicles.csv']

for filepath in filepaths:
    df = pd.read_csv(filepath)
    table_name=filepath.split('/')[-1].split('.')[0]
    df.to_sql(table_name, db)
