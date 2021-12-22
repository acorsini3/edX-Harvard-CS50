-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Check all crime scene reportd where date = 7/28 and street = Chamberlin Street
SELECT description FROM crime_scene_reports WHERE year = 2020 AND month = 7 AND day = 28 AND street = 'Chamberlin Street';
-- Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse.

-- Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.
SELECT transcript FROM interviews WHERE year = 2020 AND month = 7 AND day = 28 AND transcript like '%courthouse%'';

-- Sometime within ten minutes of the theft, I saw the thief get into a car in the courthouse parking lot and drive away.
-- If you have security footage from the courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.
SELECT name, phone_number, passport_number FROM courthouse_security_logs JOIN people ON courthouse_security_logs.license_plate = people.license_plate WHERE day = 28 AND hour = 10 AND minute > 15 AND minute < 25 AND activity = 'exit';
--Patrick | (725) 555-4692 | 2963008352
--Ernest | (367) 555-5533 | 5773159633
--Amber | (301) 555-4174 | 7526138472
--Danielle | (389) 555-5198 | 8496433585
--Roger | (130) 555-0289 | 1695452385
--Elizabeth | (829) 555-5269 | 7049073643
--Russell | (770) 555-1861 | 3592750733
--Evelyn | (499) 555-9472 | 8294398571

-- I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at the courthouse,
-- I was walking by the ATM on Fifer Street and saw the thief there withdrawing some money
SELECT name from atm_transactions JOIN bank_accounts ON atm_transactions.account_number = bank_accounts.account_number JOIN people ON bank_accounts.person_id = people.id WHERE month = 7 AND day = 28 AND transaction_type = 'withdraw' AND atm_location = 'Fifer Street';
--Ernest
--Russell
--Roy
--Bobby
--Elizabeth
--Danielle
--Madison
--Victoria


-- As the thief was leaving the courthouse, they called someone who talked to them for less than a minute.
SELECT name FROM people JOIN phone_calls ON people.phone_number = phone_calls.caller WHERE year = '2020' AND month = '7'AND day = '28' AND duration < '60';
--Roger
--Evelyn
--Ernest
--Evelyn
--Madison
--Russell
--Kimberly
--Bobby
--Victoria

-- In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
SELECT name FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE flight_id = (SELECT id FROM flights WHERE year = '2020' AND month = '7' AND day = '29' ORDER BY hour LIMIT 1);
--Doris
--Roger
--Ernest
--Edward
--Evelyn
--Madison
--Bobby
--Danielle

--the only person at the INTERSECTION of those 4 request is Ernest

-- The thief then asked the person on the other end of the phone to purchase the flight ticket.
SELECT city FROM airports WHERE id = ( SELECT destination_airport_id FROM flights WHERE year = '2020'AND month = '7' AND day = '29' ORDER BY hour, minute LIMIT 1);
--London


SELECT name FROM phone_calls JOIN people ON phone_calls.receiver = people.phone_number WHERE caller = '(367) 555-5533' AND day = '28' AND duration < 60;
--Berthold

-- sqlite3 fiftyville.db
-- .tabes
-- .schema people
