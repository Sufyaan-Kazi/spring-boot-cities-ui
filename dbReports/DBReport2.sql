select current_balance from accounts as accs where not exists (select * from transactions where tx_date like '2014-08%' and accs.start_date = amount);
