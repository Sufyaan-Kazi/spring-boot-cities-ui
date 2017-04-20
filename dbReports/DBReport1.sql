select acc_id from statements as accs where not exists (select * from transactions where tx_date like '2014-09%' and accs.year = description);
