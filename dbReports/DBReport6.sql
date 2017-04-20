select id from accounts as accs where exists (select * from transactions where tx_date like '2014-09%' and accs.start_date = amount);
