SELECT *
FROM CovidDeaths
Order by 3,4

SELECT *
FROM CovidVaccinations

Select Location, date, total_cases, new_cases,total_deaths, population
FROM CovidDeaths
Order by 1,2

--Total Cases Vs Total Deaths
Select Location, date, total_cases,total_deaths,(CAST(total_deaths as int)/CAST(total_cases as int))*100 As Death_Percentage
FROM CovidDeaths
Order by 1,2

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where location like '%states%'


SELECT Location, date, total_cases, total_deaths
FROM CovidDeaths
WHERE location LIKE'%kenya%'
ORDER BY 1, 2

--Total Cases Vs Population
SELECT Location, date,population,total_cases,t
FROM CovidDeaths
WHERE location LIKE'%kenya%'
ORDER BY 1, 2

--Country with the highest number of cases and deaths
SELECT location, MAX(total_deaths) AS Highest_deaths
FROM CovidDeaths
WHERE continent is not null
GROUP BY population, location
order by Highest_deaths DESC

--Covid 19 Highest Deaths by Continents
SELECT continent, MAX(total_deaths) AS Highest_deaths
FROM CovidDeaths
WHERE continent is not null
GROUP BY continent
order by Highest_deaths DESC

--Covid 19 Highest Deaths by Location
SELECT location, MAX(total_deaths) AS Highest_deaths
FROM CovidDeaths
WHERE continent is not null
GROUP BY location
order by Highest_deaths DESC

SELECT continent, location, date, total_cases,total_deaths
FROM CovidDeaths
WHERE continent='Africa'
Order by date desc

SELECT continent, SUM(CAST(total_cases AS INT)) as Total_Number_Of_Cases, SUM(CAST(total_deaths AS INT))
FROM CovidDeaths
WHERE continent='Africa'
GROUP BY continent

-- Total number of cases and Total Number of Deaths per continent

--SELECT continent, SUM(CAST(total_cases AS BIGINT)) as Total_Number_Of_Cases, SUM(CAST(total_deaths AS BIGINT)) as Total_Number_Of_Deaths
--FROM CovidDeaths
--WHERE continent IS NOT NULL
--GROUP BY continent
--ORDER BY Total_Number_Of_Cases DESC, Total_Number_Of_Deaths DESC

-- Total number of cases and Total Number of Deaths per continent

SELECT continent, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases, SUM(CAST(total_deaths AS BIGINT)) as Total_deaths
FROM CovidDeaths
WHERE date= '9/9/2023'
GROUP BY continent
Order by Total_Cases, Total_deaths

SELECT continent, SUM(CAST(total_cases AS BIGINT)) AS Total_Cases, SUM(CAST(total_deaths AS BIGINT)) as Total_deaths, (SUM(CAST(total_deaths AS BIGINT))/SUM(CAST(total_cases AS BIGINT)))*100 AS Death_Percentage
FROM CovidDeaths
WHERE date= '9/9/2023'
GROUP BY continent
Order by Total_Cases, Total_deaths


-- Vaccination Table
SELECT *
FROM CovidVaccinations


--Joining the two tables
SELECT *
FROM CovidVaccinations vac
JOIN CovidDeaths dea
on vac.location=dea.location and
	vac.date=dea.date



--Total Population Vs Vaccination
SELECT dea.continent, dea.location,dea.population, vac. new_vaccinations
FROM CovidVaccinations vac
JOIN CovidDeaths dea
on vac.location=dea.location and
	vac.date=dea.date
where dea.continent is not null
order by 1,2
