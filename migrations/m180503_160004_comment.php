<?php

use yii\db\Migration;

/**
 * Class m180503_160004_comment
 */
class m180503_160004_comment extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("
		CREATE TABLE `tn_comment` (
	  `comment_id` int(11) NOT NULL,
	  `parent_comment_id` int(11) DEFAULT NULL,
	  `comment` varchar(200) NOT NULL,
	  `comment_sender_name` varchar(40) NOT NULL,
	  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	ALTER TABLE `tbl_comment` CHANGE `comment_id` `id` INT(11) NOT NULL AUTO_INCREMENT, 
	CHANGE `parent_comment_id` `parent_id` INT(11) DEFAULT 0 NULL, 
	ADD COLUMN `object_id` INT(11) NULL AFTER `parent_id`, 
	ADD COLUMN `object_type` VARBINARY(55) NOT NULL AFTER `object_id`, 
	CHANGE `comment_sender_name` `created_by` VARCHAR(40) CHARSET utf8 COLLATE utf8_general_ci NOT NULL, 
	CHANGE `date` `created_at` DATETIME NOT NULL, 
	ADD COLUMN `is_deleted` SMALLINT(1) DEFAULT 0 NULL AFTER `created_at`, 
	ADD PRIMARY KEY (`id`); 
		");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180503_160004_comment cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180503_160004_comment cannot be reverted.\n";

        return false;
    }
    */
}
