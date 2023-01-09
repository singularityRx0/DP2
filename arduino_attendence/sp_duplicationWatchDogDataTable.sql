DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_duplicationWatchDogDataTable`(
	IN p_tblCreated_name VARCHAR(255),
    IN p_tblCreated_date VARCHAR(255),
    IN p_tblCreated_time VARCHAR(255)
)
BEGIN

IF ( select exists (select 1 from attendence_table_list where tblCreated_name = p_tblCreated_name) ) THEN
     
     select 'Table already Exists !!';
     
ELSE
     
	insert into attendence_table_list
        (   tblCreated_name, tblCreated_date, tblCreated_time)
        values
        (   p_tblCreated_name, p_tblCreated_date, p_tblCreated_time);

    END IF;

END$$
DELIMITER ;
