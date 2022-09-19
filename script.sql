CREATE DATABASE 'animes_api'

\c 'animes_api'

CREATE TABLE animes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(60)
)
