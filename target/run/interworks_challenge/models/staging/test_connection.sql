
  
    

        create or replace transient table RECRUITMENT_DB.CANDIDATE_00183.test_connection
         as
        (SELECT 
    CURRENT_USER() AS current_user, 
    CURRENT_ROLE() AS current_role, 
    CURRENT_DATABASE() AS current_database, 
    CURRENT_SCHEMA() AS current_schema
        );
      
  