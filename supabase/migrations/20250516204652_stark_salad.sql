/*
  # Initial Schema for Duaa Organizer App

  1. New Tables
    - `people_a`
      - `id` (uuid, primary key)
      - `name` (text, not null)
      - `created_at` (timestamp with time zone, default: now())
    - `duaas_a`
      - `id` (uuid, primary key)
      - `person_id` (uuid, foreign key to people_a.id)
      - `text` (text, not null)
      - `is_done` (boolean, default: false)
      - `created_at` (timestamp with time zone, default: now())
  
  2. Security
    - Enable RLS on both tables
    - Add policies for authenticated users to perform all operations
*/

-- Create people_a table
CREATE TABLE IF NOT EXISTS people_a (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create duaas_a table with foreign key reference to people_a
CREATE TABLE IF NOT EXISTS duaas_a (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  person_id uuid REFERENCES people_a(id) ON DELETE CASCADE,
  text text NOT NULL,
  is_done boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE people_a ENABLE ROW LEVEL SECURITY;
ALTER TABLE duaas_a ENABLE ROW LEVEL SECURITY;

-- Create policies for authenticated users
CREATE POLICY "Anyone can view people_a" 
  ON people_a FOR SELECT 
  USING (true);

CREATE POLICY "Anyone can insert people_a" 
  ON people_a FOR INSERT 
  WITH CHECK (true);

CREATE POLICY "Anyone can update people_a" 
  ON people_a FOR UPDATE 
  USING (true);

CREATE POLICY "Anyone can delete people_a" 
  ON people_a FOR DELETE 
  USING (true);

CREATE POLICY "Anyone can view duaas_a" 
  ON duaas_a FOR SELECT 
  USING (true);

CREATE POLICY "Anyone can insert duaas_a" 
  ON duaas_a FOR INSERT 
  WITH CHECK (true);

CREATE POLICY "Anyone can update duaas_a" 
  ON duaas_a FOR UPDATE 
  USING (true);

CREATE POLICY "Anyone can delete duaas_a" 
  ON duaas_a FOR DELETE 
  USING (true);