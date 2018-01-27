SELECT transactions_details.id AS _id,
       transactions_details.description,
       transactions_details.metadata,
       transactions_details.transaction_time,
       transactions_details.updated_at,
       tran_aggregate_info.tran_sum,
       tran_aggregate_info.tran_people_names,
       tran_aggregate_info.tran_people_ids
FROM   transactions_details
       LEFT OUTER JOIN (SELECT sorted_trans.transactions_details_id,
                               Sum(sorted_trans.contribution)
                               AS
                                                           tran_sum,
Group_concat(sorted_trans.people_details_id, ', ') AS
                            tran_people_ids,
Group_concat(people_details.username, ', ')        AS
                            tran_people_names
FROM   (SELECT *
 FROM   transaction_contributions
 ORDER  BY transaction_contributions.contribution DESC,
           transaction_contributions.is_consumer DESC) AS
sorted_trans
LEFT OUTER JOIN people_details
             ON people_details.id =
                sorted_trans.people_details_id
GROUP  BY sorted_trans.transactions_details_id) AS
                    tran_aggregate_info
ON tran_aggregate_info.transactions_details_id =
transactions_details.id
WHERE  transactions_details.transaction_sets_id = 1
GROUP  BY transactions_details.id;