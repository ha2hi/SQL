-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
SELECT
    h.hacker_id,
    h.name
FROM
    Hackers h
JOIN (
    SELECT
        s.hacker_id,
        count(DISTINCT s.challende_id) as full_score_count
    FROM
        Submissions s
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE
        s.score = d.score
    GROUP BY
        s.submission_id,
    HAVING
        count(DISTICNT challende_id) > 1
    ) t1 ON h.hacker_id = t1.hacker_id
ORDER BY t1.full_score_count DESC, h.hacker_id ASC;