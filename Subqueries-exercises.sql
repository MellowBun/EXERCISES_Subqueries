USE RecipesExample;

-- ********************************************************************************
-- Find all recipes that are a main couse without using a join. 7 rows expected
-- ********************************************************************************
-- RecipeTitle, RecipeClassDescription

-- Subquery Example
--SELECT RecipeTitle FROM Recipes
--WHERE RecipeClassID IN (
	--SELECT RecipeClassID FROM Recipe_Classes
	--WHERE RecipeClassDescription LIKE 'Main course')
-- must return a column

-- Types of subqueries:
-- Select list - Must return a single value
-- -- Average price of a group of items - the actual price

-- FIND STUDENT ID, GRADE AND AVERAGE GRADE OF ALL STUDENTS
--USE SchoolSchedulingExample;
--SELECT 
--	StudentID, 
--	Grade, (
--		SELECT 
--			AVG(Grade)
--		FROM Student_Schedules
--	) AS CampusAvg 
--FROM Student_Schedules


-- As a table - must return a table of data
--USE SchoolSchedulingExample;

--SELECT * FROM (
--	SELECT StudFirstName, StudLastName, Students.StudentID, ClassID, ClassStatus FROM Students -- put a view here
--	INNER JOIN Student_Schedules ON Students.StudentID = Student_Schedules.StudentID
--) AS t1
--INNER JOIN Classes ON t1.ClassID = Classes.ClassID

-- select a complex join and then further aggregate it
-- IN statement of a where clause - must return a single column
-- example below

-- in the where clause


-- part of the select list

-- as a table example



-- ********************************************************************************
-- Find all ids and titles of recipes that use beef or chicken as an ingredient.
-- ********************************************************************************
USE RecipesExample;

--SELECT * FROM Recipes
--WHERE RecipeID IN (
--	SELECT RecipeID FROM Ingredients
--	INNER JOIN Recipe_Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
--	WHERE IngredientName LIKE '%Beef%' OR IngredientName LIKE '%Chicken%'
--)



-- ********************************************************************************
-- Find all recipes using 1 or more of the top 3 most used ingredients
-- ********************************************************************************

-- first find the top 3 ingredients


-- Now find all recipes that use them
--SELECT DISTINCT RecipeTitle FROM Recipes
--INNER JOIN Recipe_Ingredients ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
--WHERE IngredientID IN (
--	SELECT TOP 3 Ingredients.IngredientID FROM Ingredients
--	INNER JOIN Recipe_Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
--	GROUP BY Ingredients.IngredientID
--	ORDER BY COUNT(*) DESC
--)


-- ********************************************************************************
-- Find the amount of each ingredient we would need to make every recipe in the database.
-- ********************************************************************************

SELECT Ingredients.IngredientID, IngredientName, MeasurementDescription, SUM(TotalMeasure) AS TotalIngredientMeasure FROM (
	SELECT 
		IngredientID,
		MeasurementDescription,
		SUM(Amount) AS TotalMeasure 
	FROM Recipe_Ingredients
	INNER JOIN Measurements ON Recipe_Ingredients.MeasureAmountID = Measurements.MeasureAmountID
	GROUP BY RecipeID, IngredientID, MeasurementDescription 
) AS t1
INNER JOIN Ingredients ON t1.IngredientID = Ingredients.IngredientID
GROUP BY Ingredients.IngredientID, MeasurementDescription
ORDER BY IngredientID ASC

--SELECT IngredientID, SUM(Amount) AS TotalAmount FROM Recipe_Ingredients
--GROUP BY IngredientID


-- ********************************************************************************
-- lets switch databases
-- ********************************************************************************
--USE SchoolSchedulingExample;

-- ********************************************************************************
-- Find the average number of classes per room of each building
-- ********************************************************************************

-- ********************************************************************************
-- find the average grade per major per state, sorted by average grade desc

-- General Studies avggrade 4.0
-- English avggrap 3.7
-- ********************************************************************************

-- ********************************************************************************
-- Find all students with a below average grade (student, student grades, average grade of all students)
-- ********************************************************************************
