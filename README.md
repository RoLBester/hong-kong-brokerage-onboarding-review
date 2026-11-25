# Hong Kong brokerage onboarding review

Futu’s opening bank transfer verifies identity and can count towards a welcome offer with separate registration. This project compares two Hong Kong brokers’ online application guides and uses SQL, SQLite and Excel to analyse 20 public reader comments. It proposes an in-app reminder before the first transfer.

[Recommendation and proposed A/B test](report.md) · [Excel workbook](onboarding-review.xlsx)

## Sources and sample

Both guides and the offer terms were accessed **25 November 2026**. The comparison follows the Hong Kong dollar Faster Payment System (FPS) route from a same-name bank account. The campaign runs from **1 November 00:00 to 30 November 2026 23:59 HKT**. The test uses Futu’s HK$10,000 Standard Reward tier. [Futu guide][fg] · [Webull guide][wg] · [November offer terms][terms]

On **25 November 2026**, dated posts and replies from both referral pages were pooled and sorted by the local time shown. The 20 newest eligible comments span **16 August to 9 November 2026**. Fly for Miles supplied 19 and Mr. Miles supplied one. The Mr. Miles originals appear in the expandable comments section below the article. [Fly for Miles][fly] · [Mr. Miles][mr]

The sample included readers’ accounts and questions about their own account opening, verification, registration, funding or rewards. First-person references were sometimes implicit in Cantonese. The sample excluded publisher replies, general reward arithmetic and third-party hypotheticals. Duplicate copies and repeated questions counted once. Follow-ups were included when they raised a new question.

Each comment has one primary theme. **Reward claims** covers finding, unlocking or using a reward. **Asset holding** covers what happens after deposit. **Offer registration** covers joining or changing an offer. **Qualifying deposits** covers when or whether funding counts. **New-user eligibility** covers prior account activity. The denominator is comments, and a reader can contribute more than one. Self-selection, different referral offers and the 19-to-one source split limit what the shares say about Futu customers overall.

## Rebuild and open

From the repository root, run these commands with the SQLite command-line shell (3.37 or later).

```sh
sqlite3 onboarding.sqlite < sql/rebuild.sql
sqlite3 -header -column onboarding.sqlite < sql/analysis.sql
```

The first command refreshes the database from the [documented steps](data/onboarding.csv) and [coded comments](data/feedback.csv). The second prints sample coverage, theme counts and shares, duplicate checks and the ordered steps. Expect 20 comments, 10 about reward claims, and zero repeated IDs, source links or paraphrases.

On the GitHub workbook page, choose **Download raw file** and open it in Microsoft Excel. **Summary** calculates counts and shares from **Feedback**. **Comparison** lists the two brokers’ steps. Both detail sheets link to the originals.

[fg]: https://www.futuhk.com/cn/en/support/topic2_9
[wg]: https://www.webull.hk/en/help/faq/1795-How-to-open-a-Webull-Securities-account
[terms]: https://www.futuhk.com/cn/en/support/topic2_2452
[fly]: https://flyformiles.hk/34810/%E5%AF%8C%E9%80%94%E8%AD%89%E5%88%B8%E5%84%AA%E6%83%A0#comments
[mr]: https://www.mrmiles.hk/futu/#comments
