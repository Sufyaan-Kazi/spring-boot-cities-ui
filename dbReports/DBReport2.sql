select statement_id from statements as accs where not exists (select * from transactions where description like '%bananas-09%' and accs.year = category);
