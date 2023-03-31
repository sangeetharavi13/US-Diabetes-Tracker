-- Joing Diabetes_Male and Diabetes_Female table
select male.Year, male.State, male.Male, female.Female, sum(male.Male+female.Female) as Total_Diagonised
from [Diabetes 2010-2020].dbo.[Diabetes Male] as male
join [Diabetes 2010-2020].dbo.[Diabetes Female] as female
on male.Year= female.Year and male.State= female.State
group by male.Year,male.State,male.Male,female.Female

-- Creating new table Diabetes_Gender(will contain DiabetesMale and DiabetesFemale)
drop table if exists Diabetes_Gender
create table Diabetes_Gender
(
Year int,
State varchar(50),
Male int,
Female int,
Total_Diagonised int
)

-- inserting values to Diabetes_Gender
insert into Diabetes_Gender
select male.Year, male.State, male.Male, female.Female, sum(male.Male+female.Female) as Total_Diagonised
from [Diabetes 2010-2020].dbo.[Diabetes Male] as male
join [Diabetes 2010-2020].dbo.[Diabetes Female] as female
on male.Year= female.Year and male.State= female.State
group by male.Year,male.State,male.Male,female.Female

-- joining Diabetes Age18-44,Diabetes Age45-64,Diabetes Age65-74 and Diabetes Age75+ table
select Age1.Year, Age1.State, Age1.Age_18_44, Age2.Age_45_64, Age3.Age_65_74, Age4.Age_75
from [Diabetes 2010-2020].dbo.[Diabetes Age 18-44] as Age1
join [Diabetes 2010-2020].dbo.[Diabetes Age 45-64] as Age2
on Age1.State=Age2.State and Age1.Year=Age2.Year
join [Diabetes 2010-2020].dbo.[Diabetes Age 65-74] as Age3
on Age2.State=Age3.State and Age2.Year=Age3.Year
join [Diabetes 2010-2020].dbo.[Diabetes Age 75+] as Age4
on Age3.State=Age4.State and Age3.Year=Age4.Year

-- creating new Diabetes_Age 
drop table if exists Diabetes_Age
create table Diabetes_Age
(
Year int,
State varchar(50),
Age_18_44 int,
Age_45_64 int,
Age_65_74 int,
Age_Above75 int
)

-- inserting data into Diabetes_Age table
insert into Diabetes_Age
select Age1.Year, Age1.State, Age1.Age_18_44, Age2.Age_45_64, Age3.Age_65_74, Age4.Age_75
from [Diabetes 2010-2020].dbo.[Diabetes Age 18-44] as Age1
join [Diabetes 2010-2020].dbo.[Diabetes Age 45-64] as Age2
on Age1.State=Age2.State and Age1.Year=Age2.Year
join [Diabetes 2010-2020].dbo.[Diabetes Age 65-74] as Age3
on Age2.State=Age3.State and Age2.Year=Age3.Year
join [Diabetes 2010-2020].dbo.[Diabetes Age 75+] as Age4
on Age3.State=Age4.State and Age3.Year=Age4.Year

-- Joining Diabetes Hispanic, Diabetes Non-Hispanic White, Diabetes Non-Hispanic Black,Diabetes Non-Hispanic Asian or Pacific Islander
select hispanic.Year, hispanic.State, hispanic.Hispanic, black.Non_Hispanic_Black, white.Non_Hispanic_White, asian.Non_Hispanic_Asian_or_Pacific_Islander
from [Diabetes 2010-2020].dbo.[Diabetes Hispanic] as hispanic
join [Diabetes 2010-2020].dbo.[Diabetes Non-Hispanic Black] as black
on hispanic.State=black.State and  hispanic.Year=black.Year
join [Diabetes 2010-2020].dbo.[Diabetes Non-Hispanic White] as white
on black.State=white.State and black.Year=white.Year
join [Diabetes 2010-2020].dbo.[Non-Hispanic Asian or Pacific Islander] as asian
on white.State=asian.State and white.Year=asian.Year

-- creating new table Diabetes_Race
drop table if exists Diabetes_Race
create table Diabetes_Race
(
Year int,
State varchar(50),
Hispanic int,
Non_Hispanic_Black int,
Non_Hispanic_White int,
Non_Hispanic_Asian_or_PacificIslander int
)

-- insert values into Diabetes_Race table
insert into Diabetes_Race
select hispanic.Year, hispanic.State, hispanic.Hispanic, black.Non_Hispanic_Black, white.Non_Hispanic_White, asian.Non_Hispanic_Asian_or_Pacific_Islander
from [Diabetes 2010-2020].dbo.[Diabetes Hispanic] as hispanic
join [Diabetes 2010-2020].dbo.[Diabetes Non-Hispanic Black] as black
on hispanic.State=black.State and  hispanic.Year=black.Year
join [Diabetes 2010-2020].dbo.[Diabetes Non-Hispanic White] as white
on black.State=white.State and black.Year=white.Year
join [Diabetes 2010-2020].dbo.[Non-Hispanic Asian or Pacific Islander] as asian
on white.State=asian.State and white.Year=asian.Year

