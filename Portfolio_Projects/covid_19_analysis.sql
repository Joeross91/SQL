/* 
Covid 19 Data Exploration 

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/
SELECT 
    *
FROM 
    PortfolioProject.dbo.CovidDeaths
WHERE 
    continent IS NOT NULL
ORDER By 
      location
    , date
--Order by columns 3 (location), 4 (date) to match with Excel file

  
/* Select Data that we're going to be starting with */

SELECT 
    location
  , date
  , total_cases
  , new_cases
  , total_deaths
  , population
FROM 
    PortfolioProject.dbo.CovidDeaths
WHERE 
    continent IS NOT NULL
ORDER By
    1
  , 2

--Altered table columns data types from nvarchar to numeric to make future calculations easier 

ALTER TABLE
    PortfolioProject.dbo.CovidDeaths
ALTER COLUMN
    total_deaths NUMERIC;

ALTER TABLE
    PortfolioProject.dbo.CovidDeaths
ALTER COLUMN
    total_cases NUMERIC;


/* Total Cases VS Total Deaths
Shows likelihood of dying if Covid is contracted in my country (USA)*/

-- Filter USA location using the LIKE operator.

SELECT 
      location
    , date
    , total_cases
    , total_deaths
    , (total_deaths/total_cases)*100 AS DeathPercentage
FROM 
    PortfolioProject.dbo.CovidDeaths
WHERE
    location LIKE '%states' AND continent IS NOT NULL
ORDER BY
    1
  , 2

--Total Cases VS Population
--Shows what percentage of population was infected with Covid

SELECT 
      location
    , date
    , population
    , total_cases
    , (total_cases/population)*100 AS PercentPopulationInfected
FROM 
    PortfolioProject.dbo.CovidDeaths
--WHERE location like '%states'
ORDER BY 
    1
  , 2

--Countries with Highest Infection Rate compared to Population

SELECT 
      location
    , population
    , MAX(total_cases) AS HighestInfectionCount
    , MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM 
    PortfolioProject.dbo.CovidDeaths
WHERE 
    location NOT LIKE '%income' AND continent IS NOT NULL
GROUP BY 
      location
    , population
ORDER BY
      PercentPopulationInfected DESC

--Countries with Highest Death Count per Population

SELECT 
      location
    , MAX(total_deaths) AS TotalDeathCount
FROM 
      PortfolioProject.dbo.CovidDeaths
WHERE 
      continent IS NOT NULL
GROUP BY 
      location
ORDER BY
      TotalDeathCount DESC

--(NOTE on previous two queries)
--USA did not have highest infection rate but did have the highest death count per population


--Breaking things down by Continent
--Showing continents with the highest death count per population

SELECT 
      continent
    , MAX(total_deaths) AS TotalDeathCount
FROM
      PortfolioProject.dbo.CovidDeaths
WHERE 
      continent IS NOT NULL
GROUP BY 
      continent
ORDER BY
      TotalDeathCount DESC

  
--Global numbers

SELECT 
      SUM(new_cases) AS total_cases
    , SUM(CAST(new_deaths AS int)) AS total_deaths
    , SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
FROM 
      PortfolioProject.dbo.CovidDeaths
WHERE 
      continent IS NOT NULL
ORDER BY 
    1
  , 2


  
--Let's look at Vaccinations table

SELECT 
      *
FROM 
      PortfolioProject.dbo.CovidVaccinations


--Joins both tables based on location and date

SELECT 
      dea.continent
    , dea.location 
    , dea.date
    , dea.population
    , vac.new_vaccinations
FROM
    PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
     ON dea.location = vac.location
	   AND dea.date = vac.date
WHERE
    dea.continent IS NOT NULL
ORDER BY 
      1
    , 2
    , 3

  
--Total Population VS Vaccinations
--Shows Percentage of Population that has received at least one vaccine
  
SELECT 
      dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM 
    PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
     ON dea.location = vac.location
	   AND dea.date = vac.date
WHERE
    dea.continent IS NOT NULL
ORDER BY 
      2
    , 3
  
-- Must cast new_vaccinations as BIGINT because it exceeds max int.
/* You can't call a column you just made, so you'll need to make a CTE or temp table
	Partition by location : the aggregate count will stop and start over at each location so it doesn't total everything */


--Total Population VS Vaccinations Using CTE
WITH Popvsvacs (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
-- You need the same number of columns called here as in the SELECT columns
AS
(
SELECT 
      dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , SUM(cast(vac.new_vaccinations as bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM 
    PortfolioProject.dbo.CovidDeaths dea
JOIN PortfolioProject.dbo.CovidVaccinations vac
     ON dea.location = vac.location
	   AND dea.date = vac.date
WHERE
    dea.continent IS NOT NULL
)
SELECT 
    *
    , (RollingPeopleVaccinated/population)*100
FROM 
    Popvsvacs

-- Using Temp Table to perform Calculation on Partition By in previous query

  
/* Total Population vs Vaccinations USING Temp Table */
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated(
      continent nvarchar(255)
    , location nvarchar(255)
    , date datetime
    , population numeric 
    , new_vaccinations numeric
    , RollingPeopleVaccinated numeric
)


INSERT INTO #PercentPopulationVaccinated
SELECT 
      dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , SUM(CAST(vac.new_vaccinations AS bigint)) OVER (Partition BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM 
    PortfolioProject.dbo.CovidDeaths AS dea
JOIN PortfolioProject.dbo.CovidVaccinations AS vac
  ON dea.location = vac.location
  AND dea.date = vac.date

SELECT 
    *
    , (RollingPeopleVaccinated/population)*100
FROM
    #PercentPopulationVaccinated


/* Creating View to store data for later visualizations */
  
CREATE VIEW PercentPopulationVaccinated AS
SELECT 
      dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , SUM(CAST(vac.new_vaccinations AS bigint)) OVER (Partition BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
-- , (RollingPeopleVaccinated/population)*100
FROM 
    PortfolioProject.dbo.CovidDeaths AS dea
JOIN PortfolioProject.dbo.CovidVaccinations AS vac
  ON dea.location = vac.location
  AND dea.date = vac.date
WHERE 
    dea.continent IS NOT NULL
