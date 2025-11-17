-- 1 
SELECT b.boohbah_id, b.name, AVG(l.sync_level) AS avg_sync
FROM boohbah b
JOIN boohbah_stand_link l
    ON b.boohbah_id = l.boohbah_id
GROUP BY b.boohbah_id, b.name;

-- 2
SELECT b.name AS boohbah, s.stand_name AS stand
FROM boohbah b
JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
JOIN jojo_stand s
ON l.stand_id = s.stand_id;

-- 3
SELECT name, color
FROM boohbah
WHERE energy_level > 80;

-- 4
SELECT b.boohbah_id, l.stand_id
FROM boohbah b
JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;

-- 5 
SELECT name
FROM boohbah
WHERE energy_level > (SELECT AVG(energy_level)
                      FROM boohbah);

-- 6
SELECT name
FROM boohbah
WHERE energy_level > ANY (
    SELECT power
    FROM jojo_stand
    WHERE season = 3
);

-- 7
SELECT b.name, s.stand_name
FROM boohbah b
JOIN boohbah_stand_link l
    ON b.boohbah_id = l.boohbah_id
JOIN jojo_stand s
    ON l.stand_id = s.stand_id
WHERE b.energy_level > 80;

-- 8 
SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (
    SELECT AVG(sync_level)
    FROM boohbah_stand_link
);

-- 9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT stand_id, boohbah_id FROM boohbah_stand_link);

-- 10
MERGE INTO boohbah b
USING (
    SELECT stand_id
    FROM jojo_stand
) s
ON (b.boohbah_id = s.stand_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = 999;


