select * 
from Portfolio_Project..CovidDeaths
where continent is not null;

--select required fields

select location,date,total_cases,new_cases,total_deaths,population
from Portfolio_Project..CovidDeaths
order by 1,2;

--Looking at total cases vs total deaths
--Shows likelihood of dying if you contract covid in your country
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as death_percentage
from Portfolio_Project..CovidDeaths
where location='India'
order by 1,2;

--Looking at totalcases vs Population
--Shows the population that is effected by  covid
select location,date,population,total_cases,(total_cases/population)*100 as total_case_percentage
from Portfolio_Project..CovidDeaths
where location='India'
order by 1,2;

--Looking at countries with highest infection rates compared to population
select location,population,max(total_cases),max((total_cases/population)*100) as max_population_infected
from Portfolio_Project..CovidDeaths
--where location='India'
group by location, population
order by max_population_infected desc;

--looking at countries with highest death rates
select location, max(cast(total_deaths as int)) as total_death_count
from Portfolio_Project..CovidDeaths
where continent is not NULL
group by location
order by total_death_count desc;


