-- 1 

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
From `porfolio project`.coviddeaths
where continent is not null  AND continent <> ''
order by 1,2;

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


-- Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
-- From PortfolioProject..CovidDeaths
---- Where location like '%states%'
-- where location = 'World'
---- Group By date
-- order by 1,2;


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

SELECT location, SUM(new_deaths) AS TotalDeathCount
FROM `porfolio project`.coviddeaths
WHERE (continent IS NULL OR continent = '')
GROUP BY location
ORDER BY TotalDeathCount DESC
LIMIT 0, 10000;



-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From`porfolio project`.coviddeaths
-- Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc;


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From `porfolio project`.coviddeaths
-- Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc
