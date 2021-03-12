
ALTER TABLE
  [powerbi].[D_Financial_incentive_type]
ALTER COLUMN
  [financial_incentive_type_id]
    VARCHAR(50) NOT NULL; 


ALTER TABLE [powerbi].[D_Financial_incentive_type] ADD CONSTRAINT D_incentive_type_pk PRIMARY KEY ([financial_incentive_type_id]); 


ALTER TABLE powerbi.F_PC_apr
	  ADD CONSTRAINT FK_F_incentive_type
 FOREIGN KEY ([In_Period_incentive_type_id]) REFERENCES [powerbi].[D_Financial_incentive_type]([financial_incentive_type_id]);