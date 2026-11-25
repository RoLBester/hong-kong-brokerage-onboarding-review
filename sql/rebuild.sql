.bail on
.mode csv
BEGIN;

-- Import the headers and original text before applying column types and keys.
.import data/onboarding.csv onboarding_csv
.import data/feedback.csv feedback_csv

DROP TABLE IF EXISTS onboarding_steps;
CREATE TABLE onboarding_steps (
    broker       TEXT NOT NULL,
    sequence     INTEGER NOT NULL CHECK (sequence > 0),
    stage        TEXT NOT NULL,
    instruction  TEXT NOT NULL,
    guide_section TEXT NOT NULL,
    source_url   TEXT NOT NULL,
    accessed_on  TEXT NOT NULL,
    PRIMARY KEY (broker, sequence)
) STRICT;

INSERT INTO onboarding_steps
SELECT broker, sequence, stage, instruction, guide_section, source_url, accessed_on
FROM onboarding_csv;

DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback (
    feedback_id   TEXT PRIMARY KEY,
    posted_local  TEXT NOT NULL,
    publisher     TEXT NOT NULL,
    primary_theme TEXT NOT NULL CHECK (length(trim(primary_theme)) > 0),
    paraphrase    TEXT NOT NULL CHECK (length(trim(paraphrase)) > 0),
    source_url    TEXT NOT NULL UNIQUE,
    captured_on   TEXT NOT NULL
) STRICT;

INSERT INTO feedback
SELECT feedback_id, posted_local, publisher, primary_theme, paraphrase, source_url, captured_on
FROM feedback_csv;

DROP TABLE onboarding_csv;
DROP TABLE feedback_csv;
COMMIT;
