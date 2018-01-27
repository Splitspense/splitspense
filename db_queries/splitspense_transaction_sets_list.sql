SELECT
  transaction_sets.id                                     AS _id,
  transaction_sets.*,
  MAX(transactions_details_summary.transaction_time)      AS max_time,
  MIN(transactions_details_summary.transaction_time)      AS min_time,
  SUM(transactions_details_summary.tran_contribution_sum) AS tran_set_worth
FROM transaction_sets
  LEFT OUTER JOIN
  (SELECT
     transactions_details.*,
     SUM(transaction_contributions.contribution) AS tran_contribution_sum
   FROM transactions_details
     LEFT OUTER JOIN
     transaction_contributions ON transaction_contributions.transactions_details_id = transactions_details.id
   GROUP BY transactions_details.id
  ) AS transactions_details_summary
    ON transaction_sets.id = transactions_details_summary.transaction_sets_id
GROUP BY transaction_sets.id;