-- Project: Hotel Analytics (2018–2020)
-- Goal: calculate total revenue using ADR, nights, and market segment discount
-- Tables used:
--   data_2018, data_2019, data_2020 (hotel bookings)
--   market_segment (discount by segment)
--   meal_cost (meal prices)
-- Note: market_segment2 and meal2 are join keys in my dataset

WITH hotels AS (
    SELECT * FROM data_2018
    UNION
    SELECT * FROM data_2019
    UNION
    SELECT * FROM data_2020
)
SELECT
    SUM((h.stays_in_weekend_nights + h.stays_in_week_nights) * ms.discount * h.adr) AS revenue
FROM hotels h
LEFT JOIN market_segment ms
    ON h.market_segment = ms.market_segment2
LEFT JOIN meal_cost mc
    ON h.meal = mc.meal2;

    