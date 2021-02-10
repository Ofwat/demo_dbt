select 
Year OFWAT_Year
,list.[Submission_Status]
,DPC.Unique_ID
,d_co.[Water_Company_ID] 
,DPC.[PC_Company_AMP_id]
,Submission_Status_ID,
e.element_ID,
form.ODI_Form_ID
,PCL 
,PCL_met 
,performance_level_actual PCL_Actual
,ODI_Type.ODI_Type_id Notional_ODI_Type_ID,
notional_outperformance_payment_or_underperformance_payment_accrued_GBPm Notional_ODI_Payment_Accrued_GBPm
,ODI_Type_INP_ODI.ODI_Type_id Payment_In_Period_ODI_Type_ID
,[outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm] Payment_In_Period_ODI_GBPm

FROM arv_staging.[stg_F_PC_APR_UNION] list
  left join arv.d_water_company d_co on list.Company=d_co.water_company_acronym

left join nw.D_PC_Company_AMP DPC on list.[Unique ID]=DPC.Unique_ID

left join [arv].[D_odi_Type] ODI_Type on list.[notional_outperformance_payment_or_underperformance_payment_accrued]=ODI_Type.ODI_Type_Description
left join [arv].[D_odi_Type] ODI_Type_INP_ODI on list.[outperformance_payment_or_underperformance_payment_in_period_ODI]=ODI_Type_INP_ODI.ODI_Type_Description
left join [arv].[D_element] e on list.[Element_price_control_acronym]=e.Element_acronym

left join  [arv].[D_ODI_Form] form on list.[ODI form]=form.[odi_form_name]
left join  arv.D_Submission_status Submission on list.[Submission_Status]=replace(Submission.submission_status_description,'APR','')
where list.Company is not null