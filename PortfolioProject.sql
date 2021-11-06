Select *
From PortfolioProject..CovidDeaths
order by 3,4

--Select *
--From PortfolioProject..CovidVaccinations
--order by 3

Select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2 

-- Looking at Total Cases vs Total Deaths
-- Chances of Dying if one gets covid in his/her country

Select Location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 DeathPercentage
from PortfolioProject..CovidDeaths
where location = 'India'
order by 1,2 


-- Looking at Total Cases vs Population
-- Percent of Population that got Covid

Select Location, date, population, total_cases, total_cases,(total_cases/population)*100 PopulationPercent
from PortfolioProject..CovidDeaths
where location = 'India'
order by 1,2 


-- Countries with higher Infection Rate

Select Location, Population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 
PercentPopulationInfected
from PortfolioProject..CovidDeaths
group by location, population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is not null
Group by Location
order by TotalDeathCount desc


-- Continent wise Data

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
where continent is not null
Group by continent
order by TotalDeathCount desc
