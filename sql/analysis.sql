-- One observation is one retained reader comment, including a distinct follow-up.
SELECT COUNT(*) AS sample_size,
       date(MIN(posted_local)) AS oldest_comment,
       date(MAX(posted_local)) AS newest_comment
FROM feedback;

SELECT publisher, COUNT(*) AS comments
FROM feedback
GROUP BY publisher
ORDER BY comments DESC, publisher;

WITH theme_counts AS (
    SELECT primary_theme, COUNT(*) AS comments
    FROM feedback
    GROUP BY primary_theme
)
SELECT primary_theme,
       comments,
       1.0 * comments / SUM(comments) OVER () AS share
FROM theme_counts
ORDER BY comments DESC, primary_theme;

SELECT COUNT(*) - COUNT(DISTINCT feedback_id) AS repeated_ids,
       COUNT(*) - COUNT(DISTINCT source_url) AS repeated_links,
       COUNT(*) - COUNT(DISTINCT lower(trim(paraphrase))) AS repeated_paraphrases
FROM feedback;

SELECT broker, sequence, stage, instruction
FROM onboarding_steps
ORDER BY broker, sequence;
