DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UIDvalidate`(
	IN p_UID VARCHAR(255)
)
BEGIN
	select * from students where UID = p_UID;
END$$
DELIMITER ;
