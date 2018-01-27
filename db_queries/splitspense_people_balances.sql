SELECT
  Sum(transaction_contributions.contribution) - Sum(CASE
                                                    WHEN
                                                      transaction_contributions.is_consumer = 1
                                                      THEN
                                                        tran_aggr_info.consumption_share
                                                    ELSE 0
                                                    END) AS person_balance,
  transaction_contributions.people_details_id            AS _id,
  people_details.username
FROM transaction_contributions
  LEFT OUTER JOIN
  (SELECT
     transaction_contributions.transactions_details_id,
     (CASE WHEN SUM(transaction_contributions.is_consumer) = 0
       THEN 0
      ELSE Sum(transaction_contributions.contribution) / Sum(
          transaction_contributions.is_consumer) END) AS
       consumption_share
   FROM transaction_contributions
   GROUP BY transaction_contributions.transactions_details_id) AS
  tran_aggr_info
    ON tran_aggr_info.transactions_details_id =
       transaction_contributions.transactions_details_id
  LEFT OUTER JOIN people_details
    ON people_details.id =
       transaction_contributions.people_details_id
WHERE transaction_contributions.transactions_details_id IN (SELECT id
                                                            FROM
                                                              transactions_details
                                                            WHERE
                                                              transaction_sets_id = 1)
GROUP BY transaction_contributions.people_details_id
ORDER BY people_details.username COLLATE NOCASE;