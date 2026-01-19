-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 08:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learnpy`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz0`
--

CREATE TABLE `quiz0` (
  `Id` int(11) NOT NULL,
  `question` text NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `answer` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz0`
--

INSERT INTO `quiz0` (`Id`, `question`, `op1`, `op2`, `op3`, `op4`, `answer`) VALUES
(1, 'What is the output of: print(2 ** 3)?', '5', '6', '8', '9', 3),
(2, 'Which of the following is a correct variable name in Python?', '2name', 'name_2', 'name-2', 'name 2', 2),
(3, 'Which keyword is used to create a function in Python?', 'func', 'define', 'def', 'function', 3),
(4, 'What does the len() function do?', 'Returns the last element', 'Returns the type', 'Returns the length', 'Returns the memory size', 3),
(5, 'Which operator is used for floor division in Python?', '/', '//', '%', '**', 2),
(6, 'What will be the output of: print(bool(\"\"))?', 'True', 'False', 'None', 'Error', 2),
(7, 'Which data type is immutable in Python?', 'List', 'Dictionary', 'Set', 'Tuple', 4),
(8, 'What is the correct file extension for Python files?', '.pyth', '.pt', '.py', '.pyt', 3),
(9, 'Which of the following is not a Python keyword?', 'continue', 'eval', 'assert', 'yield', 2),
(10, 'What is the output of: print(\"Hello\" + \"World\")?', 'Hello World', 'Hello+World', 'HelloWorld', 'Error', 3),
(11, 'What is Python mainly known for?', 'Complex syntax', 'High speed', 'Readability and simplicity', 'Low-level access', 3),
(12, 'What type is used to store text in Python?', 'int', 'bool', 'str', 'float', 3),
(13, 'Which value is a boolean?', '\'True\'', '10', '3.14', 'False', 4),
(14, 'What does casting do in Python?', 'Deletes a variable', 'Creates a loop', 'Changes data type', 'Checks syntax', 3),
(15, 'What is the result of 7 % 3?', '1', '2', '3', '0', 2),
(16, 'Which operator is used to check equality in Python?', '=', '==', '!=', 'equals', 2),
(17, 'Which of the following is a logical operator in Python?', '&', '||', 'and', '^', 3),
(18, 'What is the precedence order for \'**\' (power)?', 'Lowest', 'Middle', 'Highest', 'Doesn’t matter', 3),
(19, 'What is the output of not True?', 'True', 'False', 'None', 'Error', 2),
(20, 'What does an if statement do?', 'Repeats code', 'Sorts data', 'Evaluates a condition', 'Declares variables', 3),
(21, 'What will this print: if 4 % 2 == 0: print(\'Even\')?', 'Odd', '4', 'Even', 'Nothing', 3),
(22, 'Which structure allows multi-way branching?', 'if-else', 'while', 'for', 'if-elif-else', 4),
(23, 'What keyword ends the condition chain?', 'next', 'finish', 'else', 'endif', 3),
(24, 'Which loop repeats based on a condition?', 'for', 'while', 'repeat', 'loop', 2),
(25, 'What is the output of range(1, 4)?', '1 2 3', '0 1 2 3', '1 2 3 4', '2 3 4', 1),
(26, 'What does \"continue\" do in a loop?', 'Ends loop', 'Skips iteration', 'Restarts program', 'Pauses loop', 2),
(27, 'What does \"break\" do in a loop?', 'Skips iteration', 'Restarts loop', 'Exits loop', 'Ends program', 3),
(28, 'What kind of loop is nested?', 'Repeats functions', 'Loop inside loop', 'Loop outside loop', 'Loop that calls itself', 2),
(29, 'What is the output of: print(\"Hello\" + \"World\")?', 'Hello World', 'Hello+World', 'HelloWorld', 'Error', 3);

-- --------------------------------------------------------

--
-- Table structure for table `quiz1`
--

CREATE TABLE `quiz1` (
  `Id` int(11) NOT NULL,
  `question` text NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `answer` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz1`
--

INSERT INTO `quiz1` (`Id`, `question`, `op1`, `op2`, `op3`, `op4`, `answer`) VALUES
(1, 'What is the output of: print(2 ** 3)?', '5', '6', '8', '9', 3),
(2, 'Which of the following is a correct variable name in Python?', '2name', 'name_2', 'name-2', 'name 2', 2),
(3, 'Which keyword is used to create a function in Python?', 'func', 'define', 'def', 'function', 3),
(4, 'What does the len() function do?', 'Returns the last element', 'Returns the type', 'Returns the length', 'Returns the memory size', 3),
(5, 'Which operator is used for floor division in Python?', '/', '//', '%', '**', 2),
(6, 'What will be the output of: print(bool(\"\"))?', 'True', 'False', 'None', 'Error', 2),
(7, 'Which data type is immutable in Python?', 'List', 'Dictionary', 'Set', 'Tuple', 4),
(8, 'What is the correct file extension for Python files?', '.pyth', '.pt', '.py', '.pyt', 3),
(9, 'Which of the following is not a Python keyword?', 'continue', 'eval', 'assert', 'yield', 2),
(10, 'What is the output of: print(\"Hello\" + \"World\")?', 'Hello World', 'Hello+World', 'HelloWorld', 'Error', 3),
(11, 'Which symbol is used to define a string in Python?', '\" or \'', '``', '\"\"', '<>', 1),
(12, 'What does str1[1:n] return?', 'Full string', 'First character', 'Slice from index 1 to n-1', 'Last character only', 3),
(13, 'What does the function str.upper() do?', 'Makes first letter uppercase', 'Converts all to uppercase', 'Removes spaces', 'Does nothing', 2),
(14, 'Which string function counts occurrences of a substring?', 'str.replace()', 'str.count()', 'str.find()', 'str.slice()', 2),
(15, 'What does str.strip() do?', 'Removes internal spaces', 'Removes leading/trailing spaces', 'Adds space', 'Replaces space', 2),
(16, 'How is a list defined in Python?', 'Using {}', 'Using []', 'Using <>', 'Using ()', 2),
(17, 'Which function adds an item to a list?', '.insert()', '.append()', '.put()', '.add()', 2),
(18, 'How do you access the last element in a list L?', 'L[-1]', 'L[0]', 'L[1]', 'L[len]', 1),
(19, 'What is list slicing L[1:n]?', 'Includes index n', 'Only index 1', 'From index 1 to n-1', 'From start to end', 3),
(20, 'Which function sorts a list?', '.sort()', '.reverse()', '.order()', '.arrange()', 1),
(21, 'How is a tuple different from a list?', 'It is mutable', 'It uses brackets', 'It is immutable', 'It allows mixed types', 3),
(22, 'Which symbol is used to define a tuple?', '[]', '{}', '()', '<>', 3),
(23, 'Which of the following is a valid tuple?', '(1, 2, 3)', '[1, 2, 3]', '{1, 2, 3}', '<1, 2, 3>', 1),
(24, 'What will (1,2,3)[0] return?', '2', '3', '1', 'Tuple length', 3),
(25, 'What does \"in\" keyword do for tuples?', 'Adds element', 'Deletes element', 'Checks existence', 'Changes type', 3),
(26, 'What keyword defines a function in Python?', 'func', 'define', 'def', 'function', 3),
(27, 'Which statement exits a function and returns a value?', 'stop', 'quit', 'return', 'exit', 3),
(28, 'What is the return type when a function returns nothing?', 'void', 'none', 'empty', 'NoneType', 4),
(29, 'Which module includes sqrt() and cos()?', 'string', 'math', 'random', 'os', 2);

-- --------------------------------------------------------

--
-- Table structure for table `quiz2`
--

CREATE TABLE `quiz2` (
  `Id` int(11) NOT NULL,
  `question` text NOT NULL,
  `op1` varchar(255) NOT NULL,
  `op2` varchar(255) NOT NULL,
  `op3` varchar(255) NOT NULL,
  `op4` varchar(255) NOT NULL,
  `answer` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz2`
--

INSERT INTO `quiz2` (`Id`, `question`, `op1`, `op2`, `op3`, `op4`, `answer`) VALUES
(1, 'How do you define an empty dictionary?', '[]', 'dict()', '{}', '()', 3),
(2, 'Which type must dictionary keys be?', 'Mutable', 'Integer', 'Immutable', 'Boolean', 3),
(3, 'What does D.get(key, default) return if key is not found?', 'None', 'Error', '0', 'default', 4),
(4, 'Which method deletes and returns a key’s value?', 'remove()', 'pop()', 'delete()', 'clear()', 2),
(5, 'How do you check if a key exists in dictionary D?', '\'key\' in D', 'D.contains(\'key\')', 'D.has(\'key\')', 'D.keyExists()', 1),
(6, 'What is a characteristic of sets?', 'Allow duplicates', 'Ordered', 'Unordered and unique', 'All items must be strings', 3),
(7, 'How is a set created?', 'Using ()', 'Using []', 'Using {}', 'Using set{}', 3),
(8, 'Which method adds a single element to a set?', 'append()', 'add()', 'insert()', 'put()', 2),
(9, 'What does set1 | set2 return?', 'Intersection', 'Union', 'Difference', 'Subset', 2),
(10, 'Which method removes an item without raising error if not found?', 'remove()', 'discard()', 'pop()', 'clear()', 2),
(11, 'What is a 2D list?', 'List of integers', 'List of sets', 'List of dictionaries', 'List of lists', 4),
(12, 'Which method accesses element in 2D list at row i and column j?', 'L[i,j]', 'L[i][j]', 'L[j][i]', 'L[i].j', 2),
(13, 'Which method is used to create a 2D list using comprehension?', '[[0 for j in range(n)] for i in range(m)]', '[0]*n*m', '[0 for n]', 'None', 1),
(14, 'What does transpose of a matrix do?', 'Adds values', 'Multiplies rows', 'Swaps rows and columns', 'Sorts values', 3),
(15, 'Which loop is used to print all elements in a row of 2D list?', 'while', 'for row in matrix', 'repeat', 'foreach', 2),
(16, 'What does len(dict) return?', 'Size of values', 'Size of keys', 'Number of key-value pairs', 'None', 3),
(17, 'What data structure is used to store key-value pairs?', 'Tuple', 'Set', 'List', 'Dictionary', 4),
(18, 'Which is valid set operation?', 'set1 + set2', 'set1 & set2', 'set1 == set2', 'set1 -> set2', 2),
(19, 'Which of the following is NOT valid for 2D list?', 'Using two indices', 'Having variable-length rows', 'Using append() for rows', 'Access with a single index', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Is_admin` tinyint(1) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `prog` int(11) DEFAULT 1,
  `q1` int(11) DEFAULT 0,
  `q2` int(11) DEFAULT 0,
  `q0` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `FirstName`, `LastName`, `Email`, `Is_admin`, `Password`, `prog`, `q1`, `q2`, `q0`) VALUES
(5, 'maz', 'k', 'emakl@gmail.com', 0, '$2y$10$G1dG3GH2HBLYqK9cZl8HYuUsoPeuOV/anJdYdFW.wX7VIYhd53B4y', 1, NULL, NULL, NULL),
(6, 'mazen', 'kaikaty', 'Mazen.kaikaty1@gmail.com', 0, '$2y$10$jAT37UzXWX4IoKgugVJIV.7aKN3tCmiO663BrQsBM19p/vfJdSmgu', 1, NULL, NULL, NULL),
(7, 'mazen', 'kaikaty', 'mk@gmail.com', 0, '$2y$10$qtfIp26uQ22ar3e2YtqvkerQvoEHgGxifRHdBIUBWCfEttzBfVn26', 1, NULL, NULL, NULL),
(8, 'Mazen', 'Kaikaty', 'kkfmdm@gmail.com', 0, '$2y$10$obdOY9hHMm72LcffmkThGORICD8rjIne7rxi3FlhEqykmh5eZjTgW', 1, NULL, NULL, NULL),
(9, 'mal', 'fskn', 'jsnvslvn@gmail.com', 0, '$2y$10$WQH7c6og19i1fZlgtc3pSOdshN3wRKHtSnSWuF8TpfBbTElfXAQwG', 1, NULL, NULL, NULL),
(10, 'Jamal', 'Jamal', 'jamal.elkassar@gmail.com', 0, '$2y$10$HIGUolnog4y3WGa1OGtPw.98ru7XxjtUx2lRHgQN8cLsvx8cXyEZe', 1, NULL, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `Id` int(11) NOT NULL,
  `Uid` int(11) DEFAULT NULL,
  `Section` varchar(100) DEFAULT NULL,
  `Completed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz0`
--
ALTER TABLE `quiz0`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `quiz1`
--
ALTER TABLE `quiz1`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `quiz2`
--
ALTER TABLE `quiz2`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Uid` (`Uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz0`
--
ALTER TABLE `quiz0`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `quiz1`
--
ALTER TABLE `quiz1`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `quiz2`
--
ALTER TABLE `quiz2`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
